class AddDollarsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :dollars, :string
  end
end
