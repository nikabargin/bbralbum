class AddVideoAndSnameToSkins < ActiveRecord::Migration[5.2]
  def change
  	add_column :skins, :sname, :string
  	add_column :skins, :video, :string
  end
end
