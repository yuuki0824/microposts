class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :birthplace, :string
    add_column :users, :self_introducation, :string
  end
end
