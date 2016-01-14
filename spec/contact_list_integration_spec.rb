require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add contact path', {:type => :feature}) do
  it('creates a new contact and displays it in a list.') do
    visit('/')
    click_link('New Contact')
    fill_in_person_info()
    click_button('Add')
    expect(page).to have_content('Barack')
  end
end

def fill_in_person_info
  fill_in('first', :with => 'Barack')
  fill_in('last', :with => 'Obama')
  # fill_in('title', :with => 'POTUS')
  # fill_in('company', :with => 'The West Wing')
end
