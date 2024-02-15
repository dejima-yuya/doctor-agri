require 'rails_helper'

RSpec.describe "trainings/show", type: :view do
  before(:each) do
    assign(:training, Training.create!(
      title: "Title",
      content: "MyText",
      category_id: "",
      crop_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
