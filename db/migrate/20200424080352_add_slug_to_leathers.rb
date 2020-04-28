class AddSlugToLeathers < ActiveRecord::Migration[6.0]
  def change
    add_column :leathers, :slug, :string
    add_index :leathers, :slug, unique: true
  end
end
