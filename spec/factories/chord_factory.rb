FactoryBot.define do
    factory :chord do
        name { "Major" }
        notation { "" }

        trait :minor do
            name { "Minor" }
            notation { "m" }
        end
    end
end
