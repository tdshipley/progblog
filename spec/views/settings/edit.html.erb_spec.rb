require 'rails_helper'

RSpec.describe "settings/edit", :type => :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :comments? => false
    ))
  end

  it "renders the edit setting form" do
    render

    assert_select "form[action=?][method=?]", setting_path(@setting), "post" do

      assert_select "input#setting_comments?[name=?]", "setting[comments?]"
    end
  end
end
