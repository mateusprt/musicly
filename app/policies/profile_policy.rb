class ProfilePolicy < ApplicationPolicy

  def index?
    user.is_admin?
  end

  def show?
    user.is_admin? || record.user_id == user.id
  end

  def create?
    user.is_admin? || user.profile.nil?
  end

  def new?
    create?
  end

  def update?
    user.is_admin? || record.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.is_admin? || record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
