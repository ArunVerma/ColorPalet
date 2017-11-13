class CreateDrawings < ActiveRecord::Migration[5.1]
  def change
    create_table :drawings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :color, index: true
      t.belongs_to :grid_square, index: true
      t.timestamps
    end
  end
end
