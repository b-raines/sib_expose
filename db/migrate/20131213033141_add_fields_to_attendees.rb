class AddFieldsToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :name, :string
    add_column :attendees, :company_id, :integer
    add_column :attendees, :url, :string

    add_index :attendees, :company_id
  end
end
