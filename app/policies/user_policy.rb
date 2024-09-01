class UserPolicy < ApplicationPolicy

    def edit?
        user_matches?
    end

    def update?
        user_matches?
    end

    private
    def user_matches?
        user.id == record.id
    end
end
