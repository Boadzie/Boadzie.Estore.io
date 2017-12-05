class CreateOrder1s < ActiveRecord::Migration[5.1]
  def change
    create_table :order1s do |t|
      t.string :name
      t.text :address
      t.string :email
      t.integer :pay_type

      t.timestamps
    end
  end
end
