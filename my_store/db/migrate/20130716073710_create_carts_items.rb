class CreateCartsItems < ActiveRecord::Migration
  def up
  end
  def change
    create_table :carts_items, id:  false   do |t|
      t.integer :cart_id
      t.integer :item_id
    end

  end
  def down
  end
end
