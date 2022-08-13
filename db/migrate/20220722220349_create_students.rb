class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :father_name
      t.string :mobile_number
      t.string :jazzcash_number
      t.string :cnic
      t.string :address
      t.string :father_occupation
      t.string :emergency_number
      t.date :registered_at
      t.date :stipend_start_at
      t.date :stipend_end_at
      t.string :state
      t.integer :category_id
      t.integer :educational_id

      t.timestamps
    end
  end
end
