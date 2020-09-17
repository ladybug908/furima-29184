class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :postal_code,  null: false
      t.integer    :area_id,      null: false
      t.string     :city,         null: false
      t.string     :block,        null: false
      t.string     :build,        null: false
      t.string     :tel,          null: false
      t.references :purchase,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
