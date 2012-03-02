class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :notes
      t.boolean :wants_to_mentor
      t.boolean :wants_to_be_mentored

      t.timestamps
    end
  end
end
