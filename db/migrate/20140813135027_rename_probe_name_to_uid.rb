class RenameProbeNameToUid < ActiveRecord::Migration
  def change
    rename_column :probes, :name, :uid
  end
end
