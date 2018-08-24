class AddRememberToCrews < ActiveRecord::Migration[5.2]
  def change
    add_column :crews, :remember_token, :string
  end
end
