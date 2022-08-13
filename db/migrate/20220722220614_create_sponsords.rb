class CreateSponsords < ActiveRecord::Migration[7.0]
  def change
    create_table :sponsords do |t|
      t.string :name
      t.date :start_from
      t.date :end_to
      t.integer :student_id

      t.timestamps
    end
  end
end
