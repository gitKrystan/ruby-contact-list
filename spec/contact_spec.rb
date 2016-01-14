require('rspec')
require('contact')
require('pry')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#initialize') do
    it('adds first name, last name, job title, company, and ID to a contact') do
      test_contact = mister_t()
      expect(test_contact.first()).to(eq('Mister'))
      expect(test_contact.last()).to(eq('T'))
      expect(test_contact.job()).to(eq('the muscle'))
      expect(test_contact.company()).to(eq('A-Team'))
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds a contact to the array of saved contacts') do
      test_contact = mister_t()
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved contacts') do
      mister_t().save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end
end

def mister_t
  Contact.new({:first => 'Mister',
              :last => 'T',
              :job => 'the muscle',
              :company => 'A-Team'})
end
