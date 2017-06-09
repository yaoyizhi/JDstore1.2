class Post < ApplicationRecord
    belongs_to :info, optional: true
    belongs_to :user, optional: true
end
