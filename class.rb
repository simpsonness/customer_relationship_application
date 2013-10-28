require_relative "contact"
require_relative "rolodex"
class CRM
  def initialize(name)
    @name = name
  end

  def start
    while @quit != true
      main_menu
     end
  end


  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end


  def print_main_menu
    puts
    puts "Welcome to #{@name} CRM"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected                  
    when 1
      add_new_contact
    when 2
      modify_existing_contact 
    when 3
      delete_contact
    when 4
      display_all_contacts
    when 5
      display_an_attribut
    when 6
      exit
    end
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Rolodex.add_contact(contact)
    puts Rolodex.contacts.inspect
  end

  

  def modify_existing_contact
    display_all_contacts
    puts "Enter id:"
    index = gets.chomp.to_i - 1
    contact = Rolodex.contacts[index]
    puts "id: #{contact.id}"
    puts "first name: #{contact.first_name}"
    puts "last name: #{contact.last_name}"
    puts "email: #{contact.email}"
    puts "note: #{contact.note}"
    print "Enter  First Name: "
    first_name = gets.chomp
    contact.first_name = first_name
    print "Enter Last Name: "
    last_name = gets.chomp
    contact.last_name = last_name
    print "Enter Email Address: "
    email = gets.chomp
    contact.email = email
    print "Enter a Note: "
    note = gets.chomp
    contact.note = note
  end
    



  def delete_contact
    Rolodex.delete_contact
  end

  def display_all_contacts
    Rolodex.print_contacts
  end

  def display_an_attribut
    puts "Enter id:"
    index = gets.chomp.to_i - 1
    contact = Rolodex.contacts[index]
    puts contact.first_name
    puts contact.last_name
    puts contact.email
    puts contact.note
     
  end

  def exit
   @quit = true
  end
end

# Input dummy contact data
def prime  
  first_name = ["James", "Mark", "Angela", "Theodore", "Sarah"]
  last_name = ["Bond", "Sheffield", "La Roche", "Michaels", "Robertson"]
  email = ["jamesbond@mi6.gov.uk", "mshef@gmail.com", "angie@hotmail.com", "theo23@yahoo.com", "srobertson@aol.com"]
  note = ["This guys is badass!", "He's ok.", "Super annoying", "Great customer!", "Not much to say"]

  first_name.each_index do |i|
    contact = Contact.new(first_name[i], last_name[i], email[i], note[i])
    Rolodex.add_contact(contact)
    Rolodex.contacts  
  end
end
# End prime
prime

my_crm = CRM.new("shan")
my_crm.start

