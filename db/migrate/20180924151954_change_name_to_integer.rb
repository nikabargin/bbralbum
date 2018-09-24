class ChangeNameToInteger < ActiveRecord::Migration[5.2]
  def change
  	change_column :skins, :name, :integer, using: 'name::integer'
  end
end
