class CreateSupport < ActiveRecord::Migration
  def change
    create_table :support do |t|

      t.timestamps
    end
  end
end
