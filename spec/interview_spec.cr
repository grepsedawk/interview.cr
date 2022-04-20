require "./spec_helper"

Spectator.describe Interview do
  it "should have a version" do
    expect(Interview::VERSION).to be_a(String)
  end
end
