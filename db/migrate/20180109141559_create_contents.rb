class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|

      t.references :url, index: true
      t.string :tag
      t.text :content

      t.timestamps
    end
  end
end
