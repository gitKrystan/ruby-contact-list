require('rspec')
require('email_address')
require('pry')

describe(EmailAddress) do
  before() do
    EmailAddress.clear()
  end

  describe('#initialize') do
    it('adds address, type, contact_id, and id to an email address') do
      test_email = jenny_email()
      expect(test_email.address()).to(eq("jenny@jenny.com"))
      expect(test_email.type()).to(eq('home'))
      expect(test_email.contact_id()).to(eq(1))
      expect(test_email.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds an email to the array of saved emails') do
      test_email = jenny_email()
      test_email.save()
      expect(EmailAddress.all()).to(eq([test_email]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(EmailAddress.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved emails') do
      jenny_email().save()
      EmailAddress.clear()
      expect(EmailAddress.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns an email by its id ') do
      first_email = jenny_email()
      first_email.save()
      id_of_first_email = first_email.id()
      second_email = alicia_email()
      second_email.save()
      expect(EmailAddress.find(id_of_first_email)).to(eq(first_email))
    end
  end

  describe('.find_by_contact_id') do
    it('returns an array of emails that match the contact_id email') do
      tommy_email = jenny_email()
      tommy_email.save()
      alicia_first_email = alicia_email()
      alicia_first_email.save()
      contact_id_of_alicia = alicia_first_email.contact_id()
      alicia_second_email = alicia_work_email()
      alicia_second_email.save()
      expect(EmailAddress.find_by_contact_id(contact_id_of_alicia)).
        to(eq([alicia_first_email, alicia_second_email]))
    end
  end
end

def jenny_email
  EmailAddress.new({:address => "jenny@jenny.com",
                    :type => 'home',
                    :contact_id => 1})
end

def alicia_email
  EmailAddress.new({:address => "jenny2@jenny.com",
                    :type => 'home',
                    :contact_id => 2})
end

def alicia_work_email
  EmailAddress.new({:address => "jenny@work.com",
                    :type => 'work',
                    :contact_id => 2})
end
