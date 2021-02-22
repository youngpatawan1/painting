class Gallery < ApplicationRecord
    belongs_to :user
    has_many :paintings
end
