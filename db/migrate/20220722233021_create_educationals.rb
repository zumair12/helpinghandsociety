class CreateEducationals < ActiveRecord::Migration[7.0]
  def change
    create_table :educationals do |t|
      t.integer :degree_id
      t.integer :university_id
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
