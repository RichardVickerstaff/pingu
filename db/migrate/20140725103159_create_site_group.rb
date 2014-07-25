class CreateSiteGroup < ActiveRecord::Migration
  def change
    create_table :site_groups do |t|
      t.string :name
    end
  end
end
