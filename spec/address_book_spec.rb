require_relative '../models/address_book'

RSpec.describe AddressBook do
    describe "attributes" do
        let(:book) { AddressBook.new }
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
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    describe "#remove_entry" do
        it "removes one entry from the addres book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            book.add_entry('Kevin Doe', '222.222.2222', 'KevinDoe@gmail.com')
            
            book.remove_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            
            expect(book.entries.size).to eq(2)
        end
        it "removes the correct entry based on the index" do 
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            book.add_entry('Kevin Doe', '222.222.2222', 'KevinDoe@gmail.com')
            
            book.remove_entry('John Doe', '111.111.1111', 'JD@yahoo.com')
            entry_check = book.entries[1]
            
            expect(entry_check.name).to eq('Kevin Doe')
        end
    end 
end