require_relative 'entry'
require 'csv'

class AddressBook
        attr_reader :entries

        def initialize
            @entries = Array.new
        end

    def add_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end
        entries.insert(index, Entry.new(name, phone_number, email))
    end

    def import_from_csv(file_name)
        # reads the file into memory
        csv_text = File.read(file_name)
        # parses the CSV file into type CSV::Table
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        # iterate over CSV::Table rows
        csv.each do |row|
            # for each record create an entry into the AddressBook
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
end
