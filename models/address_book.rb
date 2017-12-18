require_relative 'entry'

    class AddressBook
        attr_reader :entries

        def initialize
            @entries = []
        end

    def add_entry(name, phone_number, email)
        # store the insertion index
        index = 0
        entries.each do |entry|
            # if name comes after the entry name
            if name < entry.name
                break
            end
            index+= 1
        end
        # insert entry into entries using the calculated index
        entries.insert(index, Entry.new(name, phone_number, email))
    end
end
