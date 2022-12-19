class Ability
  include CanCan::Ability

  def initialize(user)
    return unless current_user.present? # logged in user only can access the app (not guest)

    can(:manage, Group, user:)
    can(:manage, Expense, user:)
    can :manage, GroupExpense do |category_transaction|
      category_transaction.group.user == user
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
