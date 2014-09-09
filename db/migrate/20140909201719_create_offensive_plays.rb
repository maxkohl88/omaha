class CreateOffensivePlays < ActiveRecord::Migration
  def up
    create_table :offensive_plays do |t|
      t.string :play_name, null: false
      t.string :play_type, null: false
      t.text :player1_coordinates, array: true, null: false
      t.text :player2_coordinates, array: true, null: false
      t.text :player3_coordinates, array: true, null: false
      t.text :player4_coordinates, array: true, null: false
      t.text :player5_coordinates, array: true, null: false
      t.text :player6_coordinates, array: true, null: false
      t.text :player7_coordinates, array: true, null: false
      t.text :player8_coordinates, array: true, null: false
      t.text :player9_coordinates, array: true, null: false
      t.text :player10_coordinates, array: true, null: false
      t.text :player11_coordinates, array: true, null: false

      t.timestamps
    end
  end

  def down
    drop_table :offensive_plays
  end
end
