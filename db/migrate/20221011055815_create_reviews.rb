class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id
      t.integer :item_id
      t.integer :evaluation
      t.text :text

      t.timestamps
    end
  end
end
