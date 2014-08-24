class AddOwnerphoneToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :ownerphone, :string
  end
end
