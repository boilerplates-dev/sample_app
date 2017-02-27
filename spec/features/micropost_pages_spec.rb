require 'rails_helper'

describe 'Microposts pages', type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  subject { page }

  describe 'micropost creation' do
    before { visit root_path }

    describe 'with invalid information' do
      it 'should not create a micropost' do
        expect { click_button 'Post' }.not_to change(Micropost, :count)
      end

      describe 'error messages' do
        before { click_button 'Post' }
        it { should have_css('div.has-error') }
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'micropost_content', with: Faker::Lorem.sentence
      end

      it 'should create a micropost' do
        expect { click_button('Post') }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe 'micropost destruction' do
    before { FactoryGirl.create(:micropost, user: user) }

    describe 'as correct user' do
      before { visit root_path }

      it 'should delete a micropost' do
        expect { click_link("delete") }.to change(Micropost, :count).by(-1)
      end
    end
  end
end
