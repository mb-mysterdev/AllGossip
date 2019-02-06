class CreateFirstNameTables < ActiveRecord::Migration[5.2]
  def change
    create_table :first_name_tables do |t|
      t.string :first_name

      t.timestamps
    end
  end
end
