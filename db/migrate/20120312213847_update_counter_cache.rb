class UpdateCounterCache < ActiveRecord::Migration
  def change
    Activity.reset_column_information
    Activity.all.each do |r|
      Activity.update_counters r.id, :interests_count => r.interests.count
    end
    User.reset_column_information
    User.all.each do |r|
      User.update_counters r.id, :interests_count => r.interests.count
    end
  end
end