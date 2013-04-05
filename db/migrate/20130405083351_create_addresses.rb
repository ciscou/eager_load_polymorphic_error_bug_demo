class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :street

      t.timestamps
    end
    add_index :addresses, :addressable_id
  end
end
