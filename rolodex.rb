class Rolodex
  attr_accessor :contacts 


  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  

  def self.contacts
    @contacts
  end

  def self.print_contacts
    @contacts.each do|contact|
      puts "#{contact.id-999}: #{contact.first_name} #{contact.last_name}"
    end
  end

  def self.delete_contact
    puts "Enter number."
    num = gets.chomp.to_i
    index = contacts.index { |c| c.id == (num + 999)}
    contacts.delete_at(index)
   end

  def self.print_attribut
    puts "Enter number."
    num = gets.chomp.to_i
    index = contacts.index { |c| c.id == (num + 999)}
    puts contacts(index)
      end

end


