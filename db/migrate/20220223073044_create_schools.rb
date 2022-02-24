class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.references :user, null: false, foreign_key: true
      t.string :school_name
      t.string :school_email
      t.string :image
      t.string :introduce
      t.string :address
      t.string :phone
      t.string :home_page

      t.index ["school_email"], unique: true

      t.timestamps
    end
  end
end
