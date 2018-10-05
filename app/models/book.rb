class Book < ApplicationRecord
    validates :isbn, presence: true, length: {minimum:9, maximum: 14 }
    validates :title, presence: true
    validates :edition, presence: true
    validates :condition, presence: true
    validates :price, presence: true
    validates :author, presence: true
    validates :seller_id, presence: true
    # validates :picture_path, presence: true
end