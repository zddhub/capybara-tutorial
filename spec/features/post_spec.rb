require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    click_link('New Post')
    fill_in('post_title', with: 'my first post')
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')

    visit '/posts'
    expect(page).to have_content('my first post')
    expect(page).to have_content('I wanna be the full-stack dev')

    expect(page).to have_content('initialize component')
    expect(page).to have_content('start loading...')
    expect(find('.top-10-container').find('ul').find('li')).to have_content('my first post')
  end
end
