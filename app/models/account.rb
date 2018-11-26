#User account model
class Account < ApplicationRecord
    has_many :books, inverse_of: 'seller' do
        def selling
            where(selling: true)
        end

        def sold
            where(sold: true)
        end
    end
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.edu+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: true }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
