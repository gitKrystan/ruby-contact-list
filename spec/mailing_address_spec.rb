require('rspec')
require('mailing_address')
require('pry')

describe(MailingAddress) do
  before() do
    MailingAddress.clear()
  end

  describe('#initialize') do
    it('adds house number, street, city, state, zip code, \
        type, contact ID, and ID to an address') do
      test_address = white_house()
      expect(test_address.house_number()).to(eq('1600'))
      expect(test_address.street()).to(eq('Pennsylvania Ave'))
      expect(test_address.city()).to(eq('Washington'))
      expect(test_address.state()).to(eq('DC'))
      expect(test_address.zip()).to(eq('20500'))
      expect(test_address.type()).to(eq('work'))
      expect(test_address.contact_id()).to(eq(1))
      expect(test_address.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds an address to the array of saved addresss') do
      test_address = white_house()
      test_address.save()
      expect(MailingAddress.all()).to(eq([test_address]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(MailingAddress.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved addresss') do
      white_house().save()
      MailingAddress.clear()
      expect(MailingAddress.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns an address by its id number') do
      first_address = white_house()
      first_address.save()
      id_of_first_address = first_address.id()
      second_address = north_pole()
      second_address.save()
      expect(MailingAddress.find(id_of_first_address)).to(eq(first_address))
    end
  end
end

def white_house
  MailingAddress.new({:house_number => '1600',
                      :street => 'Pennsylvania Ave',
                      :city => 'Washington',
                      :state => 'DC',
                      :zip => '20500',
                      :type => 'work',
                      :contact_id => 1})
end

def north_pole
  MailingAddress.new({:house_number => '101',
                      :street => 'Santa Claus Lane',
                      :city => 'North Pole',
                      :state => 'AK',
                      :zip => '99705',
                      :type => 'home',
                      :contact_id => 2})
end
