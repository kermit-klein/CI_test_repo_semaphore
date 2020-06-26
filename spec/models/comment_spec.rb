# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment has db colums' do
    it { is_expected.to have_db_column :body }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'Relations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :article }
  end

  describe 'Factory' do
    it 'Should have valid factory' do
      expect(create(:comment)).to be_valid
    end
  end
end
