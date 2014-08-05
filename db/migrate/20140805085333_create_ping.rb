class CreatePing < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :response_ms

      t.belongs_to :run
      t.belongs_to :site
    end
  end
end
