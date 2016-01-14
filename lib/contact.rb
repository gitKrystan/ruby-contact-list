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
end
