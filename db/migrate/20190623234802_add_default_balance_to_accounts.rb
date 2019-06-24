class AddDefaultBalanceToAccounts < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:accounts, :balance, 0)
  end
end
