class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
