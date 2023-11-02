class Tuning < ApplicationRecord
    has_many :strings, class_name: "Pitch"
end
