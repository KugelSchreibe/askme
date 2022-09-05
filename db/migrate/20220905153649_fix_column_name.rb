class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :author, :author_id
  end
end
