FactoryBot.define do
    factory :progression_template do
        trait :with_chords do
            after(:build) do |progression_template|
                4.times {
                    progression_template.progression_chords << build(:progression_chord)
                }
            end
        end
    end
end
