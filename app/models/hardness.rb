class Hardness < ApplicationRecord
	validates :name, presence: true
	has_many :skins

	def self.options_for_select
	  order('LOWER(name)').map { |e| [e.name, e.id] }
	end
end
