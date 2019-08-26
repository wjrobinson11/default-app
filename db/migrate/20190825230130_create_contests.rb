class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :status, default: 'registering'
      t.decimal :calculated_prize_pool, precision: 8, scale: 2
      t.datetime :entry_deadline
      t.decimal :vegas_bucks, precision: 8, scale: 2
      t.decimal :entry_fee, precision: 8, scale: 2
      t.decimal :rake, precision: 8, scale: 2
      t.integer :start_week
      t.integer :end_week
      t.integer :duration_in_weeks
      t.integer :max_entrants
      t.integer :current_entrants
      t.decimal :guaranteed_prize_pool, precision: 8, scale: 2

      t.timestamps
    end

    add_index :contests, :start_week
    add_index :contests, :duration_in_weeks
    add_index :contests, :guaranteed_prize_pool
    add_index :contests, :max_entrants
    add_index :contests, :current_entrants
    add_index :contests, :status
  end
end
