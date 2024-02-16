class ChangeColumnNotNullToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column_null :surveys, :user_id, false
  end
end
