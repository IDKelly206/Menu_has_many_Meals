class AddHouseholdIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :household, null: false, foreign_key: true
  end
end
