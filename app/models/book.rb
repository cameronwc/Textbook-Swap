class Book < ApplicationRecord
    belongs_to :seller, class_name: 'Account', foreign_key: 'account_id'
    validates :isbn, presence: true, length: {minimum:9, maximum: 14 }
    validates :title, presence: true
    validates :edition, presence: true
    validates :condition, presence: true
    validates :price, presence: true
    #validates :seller_id, presence: true


    def self.find_books (text,university)
        if(university == "")
            return Book.where("(LOWER(title) like LOWER('%#{text}%') OR LOWER(author) like LOWER('%#{text}%') OR isbn='#{text}')")
        else
            return Book.joins(:seller).where("(LOWER(title) like LOWER('%#{text}%') OR LOWER(author) like LOWER('%#{text}%') OR isbn='#{text}') AND (LOWER(email) like LOWER('%@#{university}.edu'))")
        end
    end
end
