class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string 'isbn'
      t.string 'title'
      t.string 'edition'
      t.string 'condition'
      t.integer 'price'
      t.string 'author'
      t.integer 'seller_id'
      t.integer 'buyer_id'
      t.string 'picture_path'
      t.boolean 'selling'
      t.timestamps
    end
  end
end
