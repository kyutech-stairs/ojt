class AddNumberToSirabasus < ActiveRecord::Migration[5.2]
  def change
    add_column :sirabasus, :number, :integer
  end
end
