require 'spec_helper'

describe "Charts" do
  describe "frequency" do
    it "responds with with the correct template" do
      get "/charts/frequency"
      expect(response).to render_template(:frequency)
    end
  end
end