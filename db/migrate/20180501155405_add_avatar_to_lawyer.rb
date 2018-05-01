class AddAvatarToLawyer < ActiveRecord::Migration[5.0]
  def change
    add_column :lawyers, :avatar, :string
  end
end
