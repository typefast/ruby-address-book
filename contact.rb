class Contact
  attr_writer :first_name, :middle_name, :last_name
  
  def first_name
    @first_name
  end
  
  def middle_name
    @middle_name
  end
  
  def last_name
    @last_name
  end
  
  def full_name
    full_name = first_name
    if !@middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += " "
    full_name += last_name
    full_name
  end
end

harry = Contact.new
harry.first_name = "Harry"
harry.middle_name = "R"
harry.last_name = "Oliver"
puts harry.full_name
