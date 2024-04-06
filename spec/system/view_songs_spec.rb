require "rails_helper"

RSpec.describe "View Songs", type: :system do

    before(logged_in: true) do
        @user = login
    end

    before(:each) do
        10.times do
            create(:song)
        end

        visit songs_path
    end

    context "logged out" do
        it "shows at least one way to log in" do
            expect(page).to have_link_to new_user_session_path
        end

        it "shows at least one way to sign up" do
            expect(page).to have_link_to new_user_registration_path
        end

        it "shows a list of songs, which link to the songs' individual pages" do
            expect(page).to have_link_to song_path(Song.first)
        end
    end

    context "logged in", logged_in: true do
        it "shows at least one way to log out" do
            expect(page).to have_link_to destroy_user_session_path
        end
    end
end
