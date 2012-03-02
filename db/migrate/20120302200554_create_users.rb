class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :city
      t.string :college
      t.string :job

      t.timestamps
    end
  end
end
