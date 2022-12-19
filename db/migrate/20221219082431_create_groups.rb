class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.string :icon, default: 'https://i.pinimg.com/originals/9d/16/7e/9d167e72839894c971c90f60ab00d916.gif'

      t.timestamps
    end
  end
end
