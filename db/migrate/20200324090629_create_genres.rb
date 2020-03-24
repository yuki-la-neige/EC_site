class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.boolean :valid_flag
      t.string :name

      t.timestamps
    end
  end
end
