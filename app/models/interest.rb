class Interest < ActiveRecord::Base
  belongs_to :activity, counter_cache: true
  belongs_to :user, counter_cache: true

  delegate :name, to: :activity

  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.find_or_create_by_name(name) if name.present?
  end
end
