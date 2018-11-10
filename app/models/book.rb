class Book < ApplicationRecord
    belongs_to :seller, class_name: 'Account', foreign_key: 'account_id'
    validates :isbn, presence: true, length: {minimum:9, maximum: 14 }
    validates :title, presence: true
    validates :edition, presence: true
    validates :condition, presence: true
    validates :price, presence: true
    #validates :seller_id, presence: true


    def self.find_books (text, university)
        if(university == "")
            return Book.where("(LOWER(title) like LOWER('%#{text}%') OR LOWER(author) like LOWER('%#{text}%') OR isbn='#{text}') AND selling=true AND sold=false")
        else
            return Book.joins(:seller).where("(LOWER(title) like LOWER('%#{text}%') OR LOWER(author) like LOWER('%#{text}%') OR isbn='#{text}') AND (LOWER(email) like LOWER('%@#{university}.edu')) AND selling=true AND sold=false")
        end
    end


    def self.sort_books(filter, books)


        if filter == "Condition"
            #new , good, fair , poor
            new_books = Array.new
            good_books = Array.new
            fair_books = Array.new
            poor_books = Array.new
            books.each do |x|
                if x.condition == "New"
                    new_books.push(x)
                elsif x.condition == "Good"
                    good_books.push(x)
                elsif x.condition == "Fair"
                    fair_books.push(x)
                elsif x.condition == "Poor"
                    poor_books.push(x)
                end
            end
            sorted_books = new_books.append(good_books).append(fair_books).append(poor_books).flatten!
            return sorted_books

        elsif filter == "Edition"
            books.each do |x|
                x.edition = (/\d+/).match(x.edition).captures
            end
            sorted_books = books.sort!{|x,y| y.edition <=> x.edition}
            return sorted_books

        elsif filter == "Price"
            sorted_books = books.sort! {|x, y| x.price <=> y.price}
            return sorted_books

        else
            return books
        end
    end
end
