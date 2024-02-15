class ChangeColumnNullToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column_null :surveys, :user_id, true
  end
end
