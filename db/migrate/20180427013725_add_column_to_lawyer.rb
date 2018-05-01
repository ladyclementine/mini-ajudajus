class AddColumnToLawyer < ActiveRecord::Migration[5.0]
  def change
    add_column :lawyers, :first_name, :string
    add_column :lawyers, :last_name, :string
    add_column :lawyers, :state, :string
    add_column :lawyers, :homologated, :integer
  end
end
