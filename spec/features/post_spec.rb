require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create/update new post' do
    visit '/posts'

    on_page_with :post_list do |page|
      expect(page.posts_in_list.length).to eq(0)

      # new post
      page.new_post_link.click

      page.perform :fill_post, 'my first post', 'I wanna be the full-stack developer'
      page.create_post_button.click
      expect(page.success_message).to eq('Post was successfully created.')
      page.back_link.click
      expect(page).to have_content('my first post')
      expect(page.posts_in_list.length).to eq(1)
      expect(page.status_migration.text).to eq('initialize component')
      sleep(2)
      expect(page.status_migration.text).to eq('start loading...')
      sleep(2)
      expect(page.top_list.text).to eq('my first post')

      # update post
      page.edit_link.click
      page.perform :fill_post, 'my first post 1', 'I wanna be the full-stack dev'
      page.update_post_button.click
      page.back_link.click
      expect(page).to have_content('I wanna be the full-stack dev')
    end
  end
end
