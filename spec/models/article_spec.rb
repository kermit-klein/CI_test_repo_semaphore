require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Articles has db columns" do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
  end

  describe "Factory" do
    it "Should have valid factory" do
      expect(create(:article)).to be_valid
    end
  end
end
