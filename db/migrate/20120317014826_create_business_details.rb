class CreateBusinessDetails < ActiveRecord::Migration
  def change
    create_table :business_details do |t|

      t.timestamps
    end
  end
end
