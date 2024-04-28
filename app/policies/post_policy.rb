class PostPolicy< ApplicationPolicy
    def edit?
      user.admin? if user.present?
    end
    def update?
      user.admin? if user.present?
    end
  end