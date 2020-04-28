class AddPositionToLeathers < ActiveRecord::Migration[6.0]
  def change
    add_column :leathers, :position, :integer
  end
end
