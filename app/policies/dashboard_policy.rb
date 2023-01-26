class DashboardPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def index?
    user.is_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
