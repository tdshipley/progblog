require 'rails_helper'

RSpec.describe "settings/show", :type => :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :comments? => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
  end
end
