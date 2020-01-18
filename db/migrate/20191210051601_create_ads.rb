class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :platform
      t.integer :group_id
      t.string :ad_type
      t.text :description
      t.string :media_1_url
      t.string :media_1_subtitle
      t.string :media_1_title
      t.string :media_1_link
      t.string :media_2_url
      t.string :media_2_title
      t.string :media_2_link
      t.string :media_2_subtitle
      t.string :media_3_url
      t.string :media_3_title
      t.string :media_3_link
      t.string :media_3_subtitle
      t.string :media_4_url
      t.string :media_4_title
      t.string :media_4_link
      t.string :media_4_subtitle
      t.string :media_5_url
      t.string :media_5_title
      t.string :media_5_link
      t.string :media_5_subtitle
      t.string :media_6_url
      t.string :media_6_title
      t.string :media_6_link
      t.string :media_6_subtitle
      t.string :media_7_url
      t.string :media_7_title
      t.string :media_7_link
      t.string :media_7_subtitle
      t.string :media_8_url
      t.string :media_8_title
      t.string :media_8_link
      t.string :media_8_subtitle
      t.string :media_9_url
      t.string :media_9_title
      t.string :media_9_link
      t.string :media_9_subtitle
      t.string :media_10_url
      t.string :media_10_title
      t.string :media_10_link
      t.string :media_10_subtitle
      t.datetime :scheduled_at

      t.index :scheduled_at
      t.index :platform
      t.index :group_id
      t.index :ad_type

      t.timestamps
    end
  end
end
