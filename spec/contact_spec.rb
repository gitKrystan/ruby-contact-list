require('rspec')
require('contact')

describe(Contact) do
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
end

def mister_t()
  Contact.new(:first => 'Mister',
              :last => 'T',
              :job => 'the muscle',
              :company => 'A-Team')
end
