class EmailAddress
  attr_reader(:address, :type, :contact_id, :id)

  @@email_addresses = []

  def initialize(arguments)
    @address = arguments[:address]
    @type = arguments[:type]
    @contact_id = arguments[:contact_id]
    @id = @@email_addresses.length() + 1
  end

  def save
    @@email_addresses << self
  end

  def self.all
    @@email_addresses
  end

  def self.clear
    @@email_addresses = []
  end

  def self.find(identification)
    @@email_addresses.each() do |address|
      if address.id() == identification
        return address
      end
    end
  end

  def self.find_by_contact_id(contact_identification)
    found_email = []
    @@email_addresses.each() do |address|
      if address.contact_id() == contact_identification
        found_email << address
      end
    end
    found_email
  end
end
