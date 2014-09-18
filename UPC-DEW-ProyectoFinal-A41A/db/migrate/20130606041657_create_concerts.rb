class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :headline
      t.text :description
      t.datetime :datestart
      t.datetime :dateend
      t.integer :totalscore
      t.references :local
      t.references :group

      t.timestamps
    end
    add_index :concerts, :local_id
    add_index :concerts, :group_id
  end
end
