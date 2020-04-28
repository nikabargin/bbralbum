class CreateLeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :leathers do |t|
      t.string :number
      t.string :name
      t.text :description
      t.string :status
      t.string :type
      t.string :sheen
      t.string :hardness
      t.string :texture
      t.string :color1
      t.string :color2
      t.string :color3
      t.string :mprotection

      t.timestamps
    end
  end
end
