class AddAttachmentColumnToGuests < ActiveRecord::Migration
  def change
  	add_attachment :guests, :picture
  end
end
