class AddApiRequestCountToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :api_request_count, :integer, default: 0
  end
end
