require('rspec')
require('phone_number')
require('pry')

describe(PhoneNumber) do
  before() do
    PhoneNumber.clear()
  end

  describe('#initialize') do
    it('adds area code, phone number, type, contact_id, and id to a phone number') do
      test_number = jenny_number()
      expect(test_number.area_code()).to(eq('555'))
      expect(test_number.phone_number()).to(eq('8675309'))
      expect(test_number.type()).to(eq('home'))
      expect(test_number.contact_id()).to(eq(1))
      expect(test_number.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds an number to the array of saved numbers') do
      test_number = jenny_number()
      test_number.save()
      expect(PhoneNumber.all()).to(eq([test_number]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(PhoneNumber.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved numbers') do
      jenny_number().save()
      PhoneNumber.clear()
      expect(PhoneNumber.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns an phone number by its id number') do
      first_number = jenny_number()
      first_number.save()
      id_of_first_number = first_number.id()
      second_number = alicia_home()
      second_number.save()
      expect(PhoneNumber.find(id_of_first_number)).to(eq(first_number))
    end
  end

  describe('.find_by_contact_id') do
    it('returns an array of numbers that match the contact_id number') do
      tommy_number = jenny_number()
      tommy_number.save()
      alicia_first_number = alicia_home()
      alicia_first_number.save()
      contact_id_of_alicia = alicia_first_number.contact_id()
      alicia_second_number = alicia_work()
      alicia_second_number.save()
      expect(PhoneNumber.find_by_contact_id(contact_id_of_alicia)).
        to(eq([alicia_first_number, alicia_second_number]))
    end
  end
end

def jenny_number
  PhoneNumber.new({:area_code => '555',
                    :phone_number => '8675309',
                    :type => 'home',
                    :contact_id => 1})
end

def alicia_home
  PhoneNumber.new({:area_code => '347',
                    :phone_number => '4894608',
                    :type => 'home',
                    :contact_id => 2})
end

def alicia_work
  PhoneNumber.new({:area_code => '347',
                    :phone_number => '4768376',
                    :type => 'work',
                    :contact_id => 2})
end
