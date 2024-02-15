require 'rails_helper'

RSpec.describe "trainings/new", type: :view do
  before(:each) do
    assign(:training, Training.new(
      title: "MyString",
      content: "MyText",
      category_id: "",
      crop_id: ""
    ))
  end

  it "renders new training form" do
    render

    assert_select "form[action=?][method=?]", trainings_path, "post" do

      assert_select "input[name=?]", "training[title]"

      assert_select "textarea[name=?]", "training[content]"

      assert_select "input[name=?]", "training[category_id]"

      assert_select "input[name=?]", "training[crop_id]"
    end
  end
end
