class Post < ApplicationRecord
    belongs_to :info
    belongs_to :user
end
