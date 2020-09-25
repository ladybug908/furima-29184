require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet_text = Faker::Lorem.sentence
    @tweet_image = Faker::Lorem.sentence
  end
end