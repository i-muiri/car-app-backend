class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :lplate
      t.string :make
      t.string :model
      t.string :yom
      t.decimal :bp
      t.decimal :sp
      t.decimal :repcost
      t.decimal :profit

      t.timestamps
    end
  end
end
