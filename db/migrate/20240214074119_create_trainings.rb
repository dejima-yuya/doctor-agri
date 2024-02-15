class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.bigint :category_id, null: false
      t.bigint :crop_id, null: false

      t.timestamps
    end
  end
end