#Migration for the books table
class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
	    t.belongs_to :account, index: true
      t.string 'isbn'
      t.string 'title'
      t.string 'edition'
      t.string 'condition'
      t.integer 'price'
      t.string 'author'
      t.string 'picture_path'
      t.boolean 'selling', :default => false
      t.boolean 'sold', :default => false
      t.timestamps

    end
  end
end
