class Ability
  include CanCan::Ability

  def initialize(user)
#    can :read, Welcome
#
#    if user
#      if user.admin?
#        can :manage, :all
#      elsif user.teacher?
#          can :read, :all
#	  can [:create, :edit, :destroy], [Quiz, Question, Answer]
#          cannot :destroy, User, id: user_id
#      elsif user.student?
#          can :read, :all  
#      end
#    else
#      can :sign_up
#    end
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :student
      can :read, :all
      cannot :read, Answer
      cannot :read, Question
    end
  end
end
