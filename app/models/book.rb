class Book < ApplicationRecord
    belongs_to :seller, class_name: 'Account', foreign_key: 'account_id'
    validates :isbn, presence: true, length: {minimum:9, maximum: 14 }
    validates :title, presence: true
    validates :edition, presence: true
    validates :condition, presence: true
    validates :price, presence: true
    #validates :seller_id, presence: true
end
