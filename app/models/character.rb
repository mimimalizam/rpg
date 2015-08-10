class Character < ActiveRecord::Base
	belongs_to :user
	has_many :abilities, :dependent => :destroy
	validates :name, presence: true,
                    length: { minimum: 3 }
    mount_uploader :avatar, AvatarUploader
end
