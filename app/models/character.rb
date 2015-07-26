class Character < ActiveRecord::Base
	has_many :attributes
	validates :names, presence: true,
                    length: { minimum: 3 }
end
