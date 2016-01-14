class MailingAddress
  attr_reader(:house_number, :street, :city, :state, :zip, :type, :contact_id, :id)

  @@mailing_addresses = []

  def initialize(arguments)
    @house_number = arguments[:house_number]
    @street = arguments[:street]
    @city = arguments[:city]
    @state = arguments[:state]
    @zip = arguments[:zip]
    @type = arguments[:type]
    @contact_id = arguments[:contact_id]
    @id = @@mailing_addresses.length() + 1
  end

  def save
    @@mailing_addresses << self
  end

  def self.all
    @@mailing_addresses
  end

  def self.clear
    @@mailing_addresses = []
  end

  def self.find(identification)
    @@mailing_addresses.each() do |address|
      if address.id() == identification
        return address
      end
    end
  end

  def self.find_by_contact_id(contact_identification)
    found_addresses = []
    @@mailing_addresses.each() do |address|
      if address.contact_id() == contact_identification
        found_addresses << address
      end
    end
    found_addresses
  end
end
