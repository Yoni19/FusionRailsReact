class FormationCategory < ApplicationRecord
  belongs_to :formation 
  belongs_to :category
end
