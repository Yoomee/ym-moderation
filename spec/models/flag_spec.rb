require 'spec_helper'

describe Flag do

  let(:flag) {FactoryGirl.create(:flag)}
  let(:user) {FactoryGirl.create(:user)}

  describe '#resolve!' do
    
    it 'sets flag as resolved' do
      flag.resolve!(nil)
      expect(flag.resolved_at).to be_present
    end
   
    it 'sets resolved_by to be current_user' do
      flag.resolve!(user)
      expect(flag.resolved_by).to eq(user)
    end
    
  end

end