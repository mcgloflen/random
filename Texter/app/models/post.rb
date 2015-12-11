class Post < ActiveRecord::Base
    belongs_to :user
    has_many :subscribers

	validates :title,
		presence: true

	validates :description,
		presence: true
end
