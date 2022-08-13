class CreateStipends < ActiveRecord::Migration[7.0]
  def change
    create_table :stipends do |t|
      t.integer :student_id
      t.integer :amount
      t.date :stipend_in
      t.date :recevied_at
      t.string :recevied_by
      t.string :payment_method

      t.timestamps
    end
  end
end
