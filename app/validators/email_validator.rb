class EmailValidator < ActiveModel::EachValidator
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def validate_each(record, attribute, value)
    message = options[:message] || 'is not a valid email'
    record.errors[attribute] << message unless value =~ VALID_EMAIL_REGEX
  end
end
