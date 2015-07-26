class Character < ActiveRecord::Base
	belongs_to :user
	has_many :attributes
	validates :names, presence: true,
                    length: { minimum: 3 }
end
