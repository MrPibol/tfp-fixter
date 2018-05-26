class CreateDucks < ActiveRecord::Migration[5.0]
  def change
    create_table :ducks do |t|
      t.integer :row_order

      t.timestamps
    end
  end
end
