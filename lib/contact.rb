class Contact
  attr_reader(:first, :last, :job, :company, :id)

  @@contacts = []

  def initialize(arguments)
    @first = arguments[:first]
    @last = arguments[:last]
    @job = arguments[:job]
    @company = arguments[:company]
    @id = @@contacts.length() + 1
  end

  def save
    @@contacts << self
  end

  def self.all
    @@contacts
  end

  def self.clear
    @@contacts = []
  end

  def self.find (identification)
    @@contacts.each() do |contact|
      if contact.id() == identification
        return contact
      end
    end
  end
end
