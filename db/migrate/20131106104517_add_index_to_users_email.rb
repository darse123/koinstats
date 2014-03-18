class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	 add_index :users, :email, unique: true
  end
end
# bundle exec rake db:migrate