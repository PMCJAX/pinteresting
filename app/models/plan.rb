class Plan < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :owneremail, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates :company, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :goals, presence: true
	validates :primary, presence: true


	
end
