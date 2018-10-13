class Account < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.edu+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: true }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def self.OwnedBook
        #TODO: return all owned books that are not seeling
    end

    def self.SellingBooks
        #TODO: return all owned books that are seeling
    end

end
