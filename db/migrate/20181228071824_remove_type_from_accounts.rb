class RemoveTypeFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :type, :string
  end
end
