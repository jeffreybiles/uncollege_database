class Interest < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  delegate :name, to: :activity

  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.find_or_create_by_name(name) if name.present?
  end
end
