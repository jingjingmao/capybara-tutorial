require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'

    find('a[href="/posts/new"]')
    click_link('New Post')

    find('#post_title')
    fill_in('post_title', with: 'my first post')
    find('#post_content')
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    find('input[name=commit]')
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')

    click_link('Back')

    find('.tips')
    expect(page).to have_css("table td", text: "my first post")
    expect(page).not_to have_content('initialize component')
    expect(page).to have_content('start loading...')
    find('.top-10-list')
    expect(page).to have_css(".top-10-list", text: "my first post")
  end
end
