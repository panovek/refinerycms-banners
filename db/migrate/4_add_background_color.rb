class AddTypeToBanners < ActiveRecord::Migration

  def up
    add_column :refinery_banners, :background_color, :string
  end

  def down
    remove_column :refinery_banners, :background_color
  end

end
