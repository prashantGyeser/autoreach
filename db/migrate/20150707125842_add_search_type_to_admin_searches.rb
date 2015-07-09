class AddSearchTypeToAdminSearches < ActiveRecord::Migration
  def change
    add_column :admin_searches, :search_type, :string
  end
end
