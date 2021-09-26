class Entry < ApplicationRecord
    # https://guides.rubyonrails.org/v5.0/active_record_validations.html
    validates :meal, presence: true
    validates :carbs, :protein, :calories, numericality: { only_integer: true, greater_than: 0 }
end
