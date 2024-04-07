FactoryBot.define do
    factory :song do
        name { Faker::Music::RockBand.song }
        is_public { true }

        trait :private do
            is_public { false }
        end

        trait :with_progressions do
            after(:build) do |song|
                3.times {
                    song.progressions << create(:progression)
                }
            end
        end
    end
end
