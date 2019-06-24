class ChangeBalanceToDecimalOnAccounts < ActiveRecord::Migration[5.0]
  def change
    change_column :accounts, :balance, :decimal
  end
end
