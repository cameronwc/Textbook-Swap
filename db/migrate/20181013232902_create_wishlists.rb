class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.int :user_id
      t.int :book_id

      t.timestamps
    end
  end
end
