class AddVideoToLeathers < ActiveRecord::Migration[6.0]
  def change
    add_column :leathers, :video_url, :string
    add_column :leathers, :video_id, :string
  end
end
