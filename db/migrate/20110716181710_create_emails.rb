class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.address :string

      t.timestamps
    end
  end
end
