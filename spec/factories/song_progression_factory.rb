FactoryBot.define do
    factory :song_progression do
        key { Key.create(name: "C Major", shorthand: "C", flats: 0, sharps: 0, pitch_class_id: 1)}
    end
end
