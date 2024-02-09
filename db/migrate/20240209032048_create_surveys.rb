class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.boolean :is_useful, null: false
      t.boolean :is_request, null: false
      t.bigint :category_id, null: false
      t.bigint :crop_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
