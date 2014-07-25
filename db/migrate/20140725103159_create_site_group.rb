class CreateSiteGroup < ActiveRecord::Migration
  def change
    create_table :site_groups do |t|
      t.string :name
      t.has_many :sites
    end
  end
end
