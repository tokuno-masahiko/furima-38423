class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city
      t.string     :address
      t.string     :house_number
      t.string     :phone_number
      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end