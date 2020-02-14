require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should_validate_presence_of :name }
    it { should_validate_presence_of :creation_year }
    it { should_validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :studio }
  end
end
