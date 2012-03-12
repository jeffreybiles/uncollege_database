class AddCountersToActivitiesAndUsers < ActiveRecord::Migration
  def change
    add_column :activities, :interests_count, :integer
    add_column :users, :interests_count, :integer
  end
end
