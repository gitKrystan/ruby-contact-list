class PhoneNumber
  attr_reader(:area_code, :phone_number, :type, :contact_id, :id)

  @@phone_numbers = []

  def initialize(arguments)
    @area_code = arguments[:area_code]
    @phone_number = arguments[:phone_number]
    @type = arguments[:type]
    @contact_id = arguments[:contact_id]
    @id = @@phone_numbers.length() + 1
  end

  def save
    @@phone_numbers << self
  end

  def self.all
    @@phone_numbers
  end

  def self.clear
    @@phone_numbers = []
  end

  def self.find(identification)
    @@phone_numbers.each() do |number|
      if number.id() == identification
        return number
      end
    end
  end

  def self.find_by_contact_id(contact_identification)
    found_numbers = []
    @@phone_numbers.each() do |number|
      if number.contact_id() == contact_identification
        found_numbers << number
      end
    end
    found_numbers
  end
end
