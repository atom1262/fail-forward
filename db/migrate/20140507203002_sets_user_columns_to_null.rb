class SetsUserColumnsToNull < ActiveRecord::Migration
  def change
    change_column_null :users, :provider, false
    change_column_null :users, :uid, false
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :email_address, false
    change_column_null :users, :oauth_token, false
    change_column_null :users, :formatted_name, false
  end
end
