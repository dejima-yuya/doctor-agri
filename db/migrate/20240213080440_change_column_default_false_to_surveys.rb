class ChangeColumnDefaultFalseToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column_default :surveys, :is_useful, from: true, to: false
  end
end
