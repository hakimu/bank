class AddDescriptionToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :description, :string
  end
end
