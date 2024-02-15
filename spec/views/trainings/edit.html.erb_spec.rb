require 'rails_helper'

RSpec.describe "trainings/edit", type: :view do
  let(:training) {
    Training.create!(
      title: "MyString",
      content: "MyText",
      category_id: "",
      crop_id: ""
    )
  }

  before(:each) do
    assign(:training, training)
  end

  it "renders the edit training form" do
    render

    assert_select "form[action=?][method=?]", training_path(training), "post" do

      assert_select "input[name=?]", "training[title]"

      assert_select "textarea[name=?]", "training[content]"

      assert_select "input[name=?]", "training[category_id]"

      assert_select "input[name=?]", "training[crop_id]"
    end
  end
end
