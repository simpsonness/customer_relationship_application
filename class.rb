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
      find 
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

  def find
    puts "Which number?"
    number=gets.chomp.to_i
    index = Rolodex.contacts.index {|c| c.id == number}
     contact = Rolodex.contacts[index]
     modify_existing_contact(contact, index)
  end

  def modify_existing_contact(contact, index)
    puts "which you like to change?"
    puts "enter your new first name."
      Rolodex.contacts[index].first_name = gets.chomp
    puts "enter your new last name."
      Rolodex.contacts[index].last_name = gets.chomp
    puts "enter your new email."
      Rolodex.contacts[index].email = gets.chomp
    puts "enter your new note."
      Rolodex.contacts[index].email = gets.chomp
    end

  def delete_contact
    Rolodex.delete_contact
  end

  def display_all_contacts
    Rolodex.print_contacts
  end

  def display_an_attribut
    Rolodex.print_attribut 
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

