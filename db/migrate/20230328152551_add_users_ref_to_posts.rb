class AddUsersRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, foreign_key: true
  end
end