class ChangeNumberLimitOnAccounts < ActiveRecord::Migration[5.0]
  def change
    change_column :accounts, :number, :integer, limit: 10
  end
end
