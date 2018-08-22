class RenameKanrisyaToUser < ActiveRecord::Migration[5.2]
  def change
     rename_table :users, :kanrisyas
  end
end
