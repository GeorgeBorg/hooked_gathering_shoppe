class AddMollieToOrder < ActiveRecord::Migration
  def change
    add_column :shoppe_orders, :mollie_id, :string
  end
end
