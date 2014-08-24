class AddDomainToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :domain, :string
  end
end
