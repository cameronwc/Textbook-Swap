#Responsible for handling the Book model such as sorting findings through the search feature
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
            # new_books = Array.new
            # good_books = Array.new
            # fair_books = Array.new
            # poor_books = Array.new
            # books.each do |book|
            #     condition = book.condition.downcase
            #     if condition == "new"
            #         new_books.push(book)
            #     elsif condition == "good"
            #         good_books.push(book)
            #     elsif condition == "fair"
            #         fair_books.push(book)
            #     elsif condition == "poor"
            #         poor_books.push(book)
            #     end
            # end
            #return new_books.append(good_books).append(fair_books).append(poor_books).flatten!
            return sorted_books = sort_by_condition(books)
            #
        elsif filter == "edition"
            return sorted_books = books.sort_by {|book| book.edition.gsub(/\D/,'')}.reverse!
        elsif filter == "price"
            return sorted_books = books.sort {|firstbook, secondbook| firstbook.price <=> secondbook.price}
        else
            return books
        end
    end

    def self.sort_by_condition(books)
        new_books = Array.new
        good_books = Array.new
        fair_books = Array.new
        poor_books = Array.new
        books.each do |book|
            condition = book.condition.downcase
            if condition == "new"
                new_books.push(book)
            elsif condition == "good"
                good_books.push(book)
            elsif condition == "fair"
                fair_books.push(book)
            elsif condition == "poor"
                poor_books.push(book)
            end
        end
        return sorted_books = new_books.append(good_books).append(fair_books).append(poor_books).flatten!
    end
end
