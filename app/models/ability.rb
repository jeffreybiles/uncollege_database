class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.admin?
         can :manage, :all
       else
         can :read, :all
         can :splash, User
         can :manage, User do |this_user|
           this_user.id == user.id
         end
         can :create, UserSession
         can :destroy, UserSession do |this_session|
           this_session == current_user_session
         end
         can :create, Interest
         can :manage, Interest do |this_interest|
           this_interest.user_id == user.id
         end
         can [:create, :index, :show, :popular], Activity

       end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
