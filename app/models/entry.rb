class Entry < ApplicationRecord
    # https://guides.rubyonrails.org/v5.0/active_record_validations.html
    # TODO: validate not just presence but that meal is a string
    validates :meal, presence: true
    validates :carbs, :protein, :calories, numericality: { allow_nil: true, greater_than: 0 }
end
