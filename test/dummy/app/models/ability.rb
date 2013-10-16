# Don't delete comments! They are used in gems for adding abilities
class Ability
  
  include CanCan::Ability
  
  def initialize(user)
    
    # open ability
    can :create, Flagging
    
    if user.try(:admin?)
      can :manage, :all      
      # admin ability
      can :manage, FlaggingCategory
      can :manage, Flagging
      can :manage, Flag
    elsif user
      # user ability
      can :manage, User, :id => user.id      
    end
    
  end
  
end
