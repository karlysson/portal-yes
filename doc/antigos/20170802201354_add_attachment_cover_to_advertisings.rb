class AddAttachmentCoverToAdvertisings < ActiveRecord::Migration
  def self.up
    change_table :advertisings do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :advertisings, :cover
  end
end
