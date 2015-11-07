require "./contact.rb"
class AddressBook
  attr_reader :contacts
  
  def initialize()
    @contacts = []
  end
  
  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    puts "Name search results (#{search})"
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end
  
  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new
harry = Contact.new
harry.first_name = "Harry"
harry.middle_name = "R"
harry.last_name = "Oliver"
harry.add_phone_number("Work", "07866384844")
harry.add_phone_number("Play", "07866456732")
harry.add_address("home", "main st", "", "Oxford", "Oxon", "123456")
address_book.contacts.push(harry)
#address_book.print_contact_list
address_book.find_by_name('l')