#Wishlist model.
class Wishlist < ApplicationRecord
    # belongs_to :account
    validates :user_id, presence: true, numericality: { greater_than_or_equal_to:  0}
    validates :book_id, presence: true, numericality: { greater_than_or_equal_to:  0}
end
