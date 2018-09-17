class AddFiltersToSkins < ActiveRecord::Migration[5.2]
  def change
  	add_reference :skins, :type, foreign_key: true
  	add_reference :skins, :color, foreign_key: true
  	add_reference :skins, :target, foreign_key: true
  	add_reference :skins, :hardness, foreign_key: true
  end
end
