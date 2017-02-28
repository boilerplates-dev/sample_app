class User < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :reverse_relationships, foreign_key: :followed_id,
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships

  # validations ...............................................................
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  # callbacks .................................................................
  before_save { email.downcase! }
  before_create { generate_encrypted_token(:remember_token) }

  # scopes ....................................................................

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  has_secure_password

  # class methods .............................................................

  # public instance methods ...................................................
  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.exists?(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
  private

  def generate_encrypted_token(column)
    loop do
      self[column] = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
      break unless User.exists?(column => self[column])
    end
  end
end
