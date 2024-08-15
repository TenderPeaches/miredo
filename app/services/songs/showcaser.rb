module Songs
    # to showcase one or many subsets of songs, usually for a given user
    class Showcaser
        def initialize(user = nil)
            @user = user
        end

        # for now use a single method because this is only called in one place, ultimately this might get more flexible if there's the need to showcase different subsets
        def showcase
            if @user then showcase_logged_in else showcase_logged_out end
        end

        private
        # when user is logged out
        def showcase_logged_out
            # show a random sample of 5 public songs
            Result.new([Showcase.new(Song.model_name.human.pluralize, Song.find(Song.only_public.ids.sample(5)))])
        end

        # when the user is logged in
        def showcase_logged_in
            # show songs the user might want to practice because they forgot
            forgotten_songs = Showcase.new(I18n.t('content.songs.forgotten'), Song.filter_by_forgotten(@user))
            # show songs the user has been practicing a lot lately
            hot_songs = Showcase.new(I18n.t('content.songs.hot'), Song.filter_by_hot(@user))
            # show songs the user is supposed to know by heart but might not have practiced in a while
            rusty_songs = Showcase.new(I18n.t('content.songs.old_heart'), Song.filter_by_old_heart(@user))

            Result.new([forgotten_songs, hot_songs, rusty_songs])
        end

        class Showcase
            attr_accessor :title, :songs
            def initialize(title = "", songs = [])
                @title = title
                @songs = songs
            end
        end

        class Result
            attr_reader :showcases
            def initialize(showcases = [])
                @showcases = showcases
            end

            def add_showcase(title: "", songs: [])
                @showcases << Showcase.new(title, songs)
            end
        end
    end
end
