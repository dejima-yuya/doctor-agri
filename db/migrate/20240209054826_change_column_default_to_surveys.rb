class ChangeColumnDefaultToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column_default :surveys, :is_useful, from: nil, to: "true"
    change_column_default :surveys, :is_request, from: nil, to: "false"
  end
end
