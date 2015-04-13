class CreateBannersBannersPlacecontrols < ActiveRecord::Migration

  def up
    create_table :refinery_banners_placecontrols do |t|
      t.integer :page_id
      t.boolean :show_on_leftside, default: true, null: false
      t.boolean :show_on_rightside, default: true, null: false
      t.boolean :show_on_center, default: true, null: false

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-banners-placecontrols"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/banners/banners/placecontrols"})
    end

    drop_table :refinery_banners_placecontrols

  end

end
