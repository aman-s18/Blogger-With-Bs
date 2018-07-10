class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :category

      t.timestamps
    end
  end
end
