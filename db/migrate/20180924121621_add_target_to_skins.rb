class AddTargetToSkins < ActiveRecord::Migration[5.2]
  def change
  	add_column :skins, :targets, :text
  end
end
