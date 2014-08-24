class AddWebsitesToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :websites, :string
  end
end
