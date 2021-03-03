class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_img, :string
    add_column :users, :nationality, :string
    add_column :users, :introduction, :text
    add_column :users, :website, :string
  end
end
