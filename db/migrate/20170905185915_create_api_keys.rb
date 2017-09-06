class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|

      t.timestamps null: false
      t.string :api_key
      t.integer :user_id
      t.integer :request_count , :default => 0
      t.integer :per_day_request_count , :default => 0
    end
  end
end
