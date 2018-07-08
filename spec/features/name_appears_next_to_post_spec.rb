require 'rails_helper'

RSpec.feature "Name appears next to post", type: :feature do
  scenario "After user successfully makes a post" do
    sign_up_successfully

    click_link 'New Post'
    attach_file('post[image]', 'pic_for_test.30.03.png')
    fill_in "Content", with: "Test text for message!"
    click_button "Create Post"

    expect(current_path).to eq root_path
    expect(page).to have_content("Rob")
    expect(page).to have_content("Test text for message!")
  end
end