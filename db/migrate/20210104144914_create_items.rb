class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,               null:false, foreign_key: true
      t.string :name,                   null: false, default: ""
      t.text :text,                     null: false
      t.integer :value,                 null: false
      t.integer :category_id,           null: false
      t.integer :condition_id,          null: false
      t.integer :shipment_day_id,       null: false
      t.integer :postage_id,            null: false
      t.integer :prefecture_id,         null: false
      t.timestamps
    end
  end
end
