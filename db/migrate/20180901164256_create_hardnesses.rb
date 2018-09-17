class CreateHardnesses < ActiveRecord::Migration[5.2]
  def change
    create_table :hardnesses do |t|
      t.string :name
    end
  end
end
