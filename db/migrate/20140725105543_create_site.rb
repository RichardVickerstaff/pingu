class CreateSite < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :url
      t.belongs_to :site_group
    end
  end
end
