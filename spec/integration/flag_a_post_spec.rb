require 'spec_helper'

describe 'Flagging a post' do

  let(:post) {FactoryGirl.create(:post)}

  context 'logged out' do

    before do
      visit "/posts/#{post.id}"
    end

    it 'displays a flag link' do
      expect(page).to have_xpath("//a[@href = '/flaggings/new?resource_id=#{post.id}&resource_type=Post']")
    end

    context 'clicked flag link', :js => true do

      before do
        click_link('Report')
      end

      it 'displays modal with flags#form' do
        expect(page).to have_css(".flag-modal#Post-#{post.id}")
      end

      context 'submitted flags#form' do

        it 'displays thanks message' do
          within '.flag-modal' do
            expect(page).to have_content("thanks")
          end
        end

        it 'creates new flag record' do
          flag = Flag.where(:resource_type => 'Post', :resource_id => post.id).first
          expect(flag).to exist
          expect(flag.flaggings.where(:description => 'This is inappropriate', :email => 'edward@yoomee.com')).to exist
        end

      end

    end

  end

  # context 'logged in' do
  # end

end
