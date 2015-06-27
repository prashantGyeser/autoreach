class CreateAdminSearches < ActiveRecord::Migration
  def change
    create_table :admin_searches do |t|
      t.string :keywords

      t.timestamps null: false
    end
  end
end
