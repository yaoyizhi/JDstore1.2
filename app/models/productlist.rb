class Productlist < ApplicationRecord
    belongs_to :order, optional: true
end
