require_relative '../models/address_book'

class MenuController
    attr_reader :address_book

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu
        puts "Main Menu - #{address_book.entries} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - Exit"
        print "Enter your selection: "

        # gets retrieves from standard input
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
                puts "Good-bye!"
                # 0 signals the program is exiting withou an error
                exit(0)

            # catches invalid entries and redirects to main menu
            else
                system "clear"
                puts "**Sorry, that is not a vaild input**\n"
                main_menu
        end
    end

    def view_all_entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s

            entry_submenu(entry)
        end

        system "clear"
        puts "End of entries"
    end

    def create_entry
        # clears the screen
        system "clear"
        puts "New AddresBloc Entry"

        # prompt user for each Entry attribute
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp

        # add a new entry using add_entry and ensure entry added in proper order
        address_book.add_entry(name, phone, email)

        system "clear"
        puts "New entry created"
    end

    def search_entries
    end

    def read_csv
    end

    def entry_submenu
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"

        # chomp removes any trailing whitespace from the string gets returns
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