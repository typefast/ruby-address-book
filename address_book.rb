require "./contact.rb"
class AddressBook
  attr_reader :contacts
  
  def initialize()
    @contacts = []
  end
  
  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end
  
  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("name search results (#{search})", results)
  end
  
  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})", results)
  end
  
  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
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
#address_book.find_by_name('l')
#address_book.find_by_phone_number("07")
address_book.find_by_address("main")