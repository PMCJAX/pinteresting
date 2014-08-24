class AddOwneremailToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :owneremail, :string
  end
end
