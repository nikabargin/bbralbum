class RemoveTypeFromLeathers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :leathers, :type
  	add_column :leathers, :nature, :string
  end
end
