class AddVideoLinkToPins < ActiveRecord::Migration
  def change
    add_column :pins, :yt_tube_id, :string
  end
end
