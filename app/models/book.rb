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
		return Book.where("(LOWER(title) like LOWER('%#{text}%') OR LOWER(author) like LOWER('%#{text}%') OR isbn='#{text}') AND selling=true AND sold=false").to_a
        else
		return Book.joins(:seller).where("(LOWER(title) like LOWER('%#{text}%') OR LOWER(author) like LOWER('%#{text}%') OR isbn='#{text}') AND (LOWER(email) like LOWER('%@#{university}.edu')) AND selling=true AND sold=false").to_a
        end
    end


    def self.sort_books(filter, books)

        filter = filter.downcase
        if filter == "condition"
            #new , good, fair , poor
            new_books = Array.new
            good_books = Array.new
            fair_books = Array.new
            poor_books = Array.new
            books.each do |x|
                if x.condition.downcase == "new"
                    new_books.push(x)
                elsif x.condition.downcase == "good"
                    good_books.push(x)
                elsif x.condition.downcase == "fair"
                    fair_books.push(x)
                elsif x.condition.downcase == "poor"
                    poor_books.push(x)
                end
            end
            sorted_books = new_books.append(good_books).append(fair_books).append(poor_books).flatten!
            return sorted_books

        elsif filter == "edition"
            sorted_books = books.sort_by {|book| book.edition.gsub(/\D/,'')}.reverse!
            return sorted_books

        elsif filter == "price"
            sorted_books = books.sort {|x, y| x.price <=> y.price}
            return sorted_books

        else
            return books
        end
    end
end
