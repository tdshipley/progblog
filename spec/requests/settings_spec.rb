require 'rails_helper'

RSpec.describe "Settings", :type => :request do
  describe "GET /settings" do
    it "works! (now write some real specs)" do
      get settings_path
      expect(response.status).to be(200)
    end
  end
end
