class SongPolicy < ApplicationPolicy

    # show song only if it's public or if the user is the song maintainer
    def show?
        record.is_public || is_submitter?
    end

    def edit?
        is_submitter?
    end

    def update?
        is_submitter?
    end

    private
    def is_submitter?
        user.id == record.submitter_id
    end
end
