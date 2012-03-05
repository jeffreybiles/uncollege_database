class ChangeNotesToText < ActiveRecord::Migration
  def change
    remove_column :interests, :notes
    add_column :interests, :notes, :text
  end
end
