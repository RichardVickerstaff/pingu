class CreateRun < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.belongs_to :probe
      t.timestamps
    end
  end
end
