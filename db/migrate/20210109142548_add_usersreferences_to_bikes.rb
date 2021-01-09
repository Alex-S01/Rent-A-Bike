class AddUsersreferencesToBikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :bikes, :user, foreign_key: true
  end
end
