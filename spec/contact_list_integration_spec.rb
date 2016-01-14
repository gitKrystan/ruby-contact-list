require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
include Capybara::DSL
set(:show_exceptions, false)

describe('the contact book page') do
  before() do
    Contact.clear()
    EmailAddress.clear()
    MailingAddress.clear()
    PhoneNumber.clear()
  end

  describe('the add contact path', {:type => :feature}) do
    it('creates a new contact and displays it in a list.') do
      create_a_contact()
      expect(page).to have_content('Barack')
    end
  end

  describe('the view contact path', {:type => :feature}) do
    it('displays information for a selected contact') do
      create_a_contact()
      click_link('Obama, Barack')
      expect(page).to have_content('Barack')
    end
  end

  describe('the new phone number path') do
    it('creates a new phone number for a given contact') do
      create_a_contact()
      click_link('Obama, Barack')
      click_link('Update Contact')
      fill_in('new_number_area', :with => '555')
      fill_in('new_number', :with => '8675309')
      click_button('Update')
      expect(page).to have_content('8675309')
    end
  end
end

def create_a_contact
  visit('/')
  click_link('New Contact')
  fill_in_person_info()
  click_button('Add')
end

def fill_in_person_info
  fill_in('first', :with => 'Barack')
  fill_in('last', :with => 'Obama')
  fill_in('title', :with => 'POTUS')
  fill_in('company', :with => 'The West Wing')
end
