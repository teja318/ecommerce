class AddStockToProducts < ActiveRecord::Migration
  def change
  add_column :products, :stock, :integer
  add_column :products, :cod_eligible, :boolean ,default:true
  add_column :products, :categories, :integer

  end
end
