require_relative '../models/address_book'
 
class MenuController
    attr_reader :address_book
 
    def initialize
        @address_book = AddressBook.new
    end
 
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - Exit"
        print "Enter your selection: "
 

        selection = gets.to_i
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                create_entry
                main_menu
            when 3
                system "clear"
                search_entries
                main_menu
            when 4
                system "clear"
                read_csv
                main_menu
            when 5
                puts "Good-Bye!"
            
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end

    def view_all_entries
        address_book.entries.each_with_index do |entry, index|
            system "clear"
            puts "Entry number: #{index + 1}"
            puts entry.to_s
            
            entry_submenu(entry)
        end
        
        system "clear"
        puts "End of entries"
    end
    
    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        
        system "clear"
        puts "New entry created"
    end
    
    def number_or_nil(string)
        num = string.to_i
        num if num.to_s == string
    end
    
    def search_entries
        print "Please entry your address number: "
        selection_number = gets.chomp
        selection_number = number_or_nil(selection_number)
        if selection_number == nil
            system "clear"
            puts "Invalid selection, please enter a number"
            search_entries
        end
        entry_display_selection = address_book.entries[selection_number - 1]
        if entry_display_selection == nil
            system "clear"
            puts "No such entry exists\nWould you like to try another search? Y/N"
            retry_search = gets.chomp
            retry_search.upcase!
            if retry_search == "Y"
                system "clear"
                search_entries
            else
                system "clear"
                main_menu
            end
        elseif entry_display_selection < 0
            system "clear"
            puts "No such entry exists\nWould you like to try another search? Y/N"
            retry_search = gets.chomp
            retry_search.upcase
            if retry_search == "Y"
                system "clear"
                search_entries
            else
                system "clear"
                main_menu
            end
        else
            entry = address_book.entries[selection_number - 1]
            system "clear"
            puts "Entry number: #{selection_number}"
            puts entry.to_s
            entry_submenu(entry)
        end
    end
    
    def read_csv
    end
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        selection = gets.chomp
        
        case selection
            when "n"
                
            when "d"
                
            when "e"
                
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end
end