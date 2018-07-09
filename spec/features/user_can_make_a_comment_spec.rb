require 'rails_helper'

RSpec.feature "User can make a comment on a post", type: :feature do
  scenario "successfully" do
    sign_up_successfully
    visit root_path
    click_link 'New Post'
    attach_file('post[image]', 'pic_for_test.30.03.png')
    fill_in "Content", with: "Test text for message!"
    click_button "Create Post"

    click_button 'Comment'
    fill_in 'CommentText', with: "Here's a comment on this post!"
    click_button 'Submit'

    expect(current_path).to eq root_path
    expect(page).to have_content("Here's a comment on this post!")
  end
end
