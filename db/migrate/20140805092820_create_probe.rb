class CreateProbe < ActiveRecord::Migration
  def change
    create_table :probes do |t|
      t.string :name
      t.string :location
      t.string :ip
    end
  end
end
