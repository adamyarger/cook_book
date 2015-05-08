class Recipe < ActiveRecord::Base
	validates :title, presence: true
end
