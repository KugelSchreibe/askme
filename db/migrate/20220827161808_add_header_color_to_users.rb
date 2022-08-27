class AddHeaderColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :header_color, :string, default: '#0BA5BE'
  end
end
