class AddPasswordDigestToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :password_digest, :string
  end
end
