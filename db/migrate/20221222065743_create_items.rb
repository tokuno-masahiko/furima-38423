class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_date_id, null: false
      t.integer :item_fee, null: false
      t.references :user, null: false, foreign_key: true
      # t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
