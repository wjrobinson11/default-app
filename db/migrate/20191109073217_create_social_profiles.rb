class CreateSocialProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :social_profiles do |t|
      t.datetime :access_token_expires_at
      t.string :avatar_url
      t.string :consumer_key
      t.string :consumer_secret
      t.integer :follower_count
      t.string :id_str
      t.integer :group_id
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :platform
      t.string :screen_name
      t.string :status

      t.timestamps

      t.index :platform
      t.index :group_id
      t.index :status
      t.index :id_str
    end
  end
end
