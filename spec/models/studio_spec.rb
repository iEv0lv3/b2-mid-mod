require 'rails_helper'

RSpec.describe 'As a something', type: :model do
  describe 'validations' do
    it { should_validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :movies }
  end
end
