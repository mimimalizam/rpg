class Character < ActiveRecord::Base
	validates :names, presence: true,
                    length: { minimum: 3 }
end
