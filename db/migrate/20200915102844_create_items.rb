class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,                      null: false, limit: 40
      t.text       :description,                    null: false, limit: 1000
      t.integer    :category,                       null: false
      t.integer    :status,                         null: false
      t.integer    :fee,                            null: false
      t.integer    :area,                           null: false
      t.integer    :days,                           null: false
      t.integer    :price,                          null: false
      t.references :user,                           foreign_key: true
      t.timestamps
    end
  end
end
