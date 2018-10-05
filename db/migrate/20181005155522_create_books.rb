class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string 'isbn'
      t.string 'title'
      t.string 'edition'
      t.string 'condition'
      t.string 'price'
      t.string 'author'
      t.string 'seller_id'
      t.string 'buyer_id'
      t.string 'picture_path'
      t.timestamps
    end
  end
end
