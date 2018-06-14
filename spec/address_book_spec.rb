require_relative '../models/address_book'

RSpec.describe AddressBook do
    
    let(:book) {AddressBook.new}
    
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq(expected_name)
        expect(entry.phone_number).to eq(expected_number)
        expect(entry.email).to eq(expected_email)
    end
    
    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do 
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do 
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    describe "#import_from_csv" do
        it "imports the correct number of entries" do 
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            
            expect(book_size).to eq(5)
        end
        it "imports the first entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[0]
            
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end
        it "imports the second entry" do
            book.import_from_csv("entries.csv")
            entry_two = book.entries[1]
            
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        end
        it "imports the third entry" do
            book.import_from_csv("entries.csv")
            entry_three = book.entries[2]
            
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
        it "imports the fourth entry" do
            book.import_from_csv("entries.csv")
            entry_four = book.entries[3]
            
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        end
        it "imports the fifth entry" do
            book.import_from_csv("entries.csv")
            entry_five = book.entries[4]
            
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
        it "imports the correct number of entries from a different entries.csv" do
            book.import_from_csv("entries_2.csv")
            book_size = book.entries.size
            
            expect(book_size).to eq(3)
        end
        it "imports the first entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[0]
            
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end
        it "imports the second entry" do
            book.import_from_csv("entries_2.csv")
            entry_two = book.entries[1]
            
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        end
        it "imports the third entry" do
            book.import_from_csv("entries_2.csv")
            entry_three = book.entries[2]
            
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
    end
    
    describe "#binary_search" do
        it "searches AddressBook for a non-existent entry" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Dan")
            expect(entry).to be_nil
        end
        it "searches AddressBook for Bill" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Bill")
            expect(entry).to be_a Entry
            check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
        end
        it "searches AddressBook for Bob" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Bob")
            expect(entry).to be_a Entry
            check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
        end
 
        it "searches AddressBook for Joe" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Joe")
            expect(entry).to be_a Entry
            check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
        end
 
        it "searches AddressBook for Sally" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Sally")
            expect(entry).to be_a Entry
            check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
        end
 
        it "searches AddressBook for Sussie" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Sussie")
            expect(entry).to be_a Entry
            check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
        it "searches AddressBook for Billy" do 
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Billy")
            expect(entry).to be_nil
        end
    end
    
    describe "#remove_entry" do
        it "removes one entry from the addres book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            book.add_entry('Kevin Doe', '222.222.2222', 'KevinDoe@gmail.com')
            
            book.remove_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            
            expect(book.entries.size).to eq(2)
        end
        it "removes the correct entry based on the index" do 
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            book.add_entry('Kevin Doe', '222.222.2222', 'KevinDoe@gmail.com')
            
            book.remove_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            entry_check = book.entries[1]
            
            expect(entry_check.name).to eq('Kevin Doe')
        end
    end 
end