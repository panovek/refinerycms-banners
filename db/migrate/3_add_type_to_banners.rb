class AddTypeToBanners < ActiveRecord::Migration

  def up
    add_column :refinery_banners, :banner_type, :integer, null: false
  end

  def down
    remove_column :refinery_banners, :banner_type
  end

end
