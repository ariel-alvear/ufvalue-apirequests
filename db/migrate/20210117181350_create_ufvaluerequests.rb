class CreateUfvaluerequests < ActiveRecord::Migration[6.1]
  def change
    create_table :ufvaluerequests do |t|
      t.string :client
      t.date :requestedDate
      t.float :ufvalue

      t.timestamps
    end
  end
end
