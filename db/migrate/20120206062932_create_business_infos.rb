class CreateBusinessInfos < ActiveRecord::Migration
  def change
    create_table :business_infos do |t|

      t.timestamps
    end
  end
end
