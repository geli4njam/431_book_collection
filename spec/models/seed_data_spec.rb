require 'rails_helper'

RSpec.describe "Seed Data", type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  it "loads at least 5 seeded books into the test database" do
    expect(Book.count).to be >= 5
  end
end