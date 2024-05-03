class Admin::AccessLogPolicy < ApplicationPolicy
   def index?
    user&.admin?
   end
end


