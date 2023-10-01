class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.boolean :is_all_day
      t.text :memo
      t.time :time
      t.date :date
      t.datetime :datetime

      t.timestamps
    end
  end
end
