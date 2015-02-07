class CreateBannersBanners < ActiveRecord::Migration

  def up
    create_table :refinery_banners do |t|
      t.string :title
      t.string :link
      t.integer :image_id
      t.text :description
      t.integer :position
      t.boolean :is_active, default: true, null: false
      t.date :start_date
      t.date :expiry_date

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-banners"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/banners/banners"})
    end

    drop_table :refinery_banners

  end

end
