class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :company
      t.string :address
      t.string :phone
      t.string :fax
      t.string :tollfree
      t.string :goals
      t.string :primary
      t.string :secondary
      t.string :demographic
      t.string :competitors
      t.string :emails
      t.string :notes

      t.timestamps
    end
  end
end
