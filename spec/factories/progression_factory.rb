FactoryBot.define do
    factory :progression do
        trait :with_chords do
            after(:build) do |progression|
                4.times {
                    progression.progression_chords << build(:progression_chord)
                }
            end
        end
    end
end
