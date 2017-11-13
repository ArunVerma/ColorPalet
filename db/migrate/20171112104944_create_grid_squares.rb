class CreateGridSquares < ActiveRecord::Migration[5.1]
  def change
    create_table :grid_squares do |t|
      t.integer :cell_id, null: false 
      t.timestamps
    end
  end
end
