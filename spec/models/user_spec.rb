require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
  end

  descrive 'Relationships' do
    it { should have_one(:location) }
  end
end
