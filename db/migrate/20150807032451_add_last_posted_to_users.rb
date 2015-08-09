class AddLastPostedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_posted, :datetime
  end
end
