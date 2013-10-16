require 'spec_helper'

describe 'Flagging a post', :js => true do

  let(:post) {FactoryGirl.create(:post)}
  
  context 'logged out' do

    before do
      visit "/posts/#{post.id}"
    end

    it 'displays a flag link' do
      expect(page).to have_xpath("//a[@href = '/flaggings/new?resource_id=#{post.id}&resource_type=Post']")
    end

    context 'clicked flag link' do

      before do
        click_link('Report')
      end

      it 'displays modal with flags#form' do
        expect(page).to have_css("#Post#{post.id}")
      end

      context 'submitted flags#form' do

        before do
          within("#Post#{post.id}") do
            fill_in 'flagging_description', :with => 'This is inappropriate'
            fill_in 'flagging_email', :with => 'edward@yoomee.com'
            click_on 'Report content'
          end
        end

        it 'displays thanks message and create flag' do
          modal_body = find(:css, "#Post#{post.id} .modal-body")
          expect(modal_body).to have_content('Thanks for telling us!')
          expect(Flag.where(:resource_type => 'Post', :resource_id => post.id)).to exist
          flag = Flag.where(:resource_type => 'Post', :resource_id => post.id).first
          expect(flag.flaggings.where(:description => 'This is inappropriate', :email => 'edward@yoomee.com')).to exist
        end

      end

    end

  end

  context 'logged in' do
    
    let(:user) {FactoryGirl.create(:user)}

    before do
      visit '/login'
      fill_in('user_email', :with => user.email)
      fill_in('user_password', :with => 'password')
      click_on 'Login'
      visit "/posts/#{post.id}"
    end

    it 'displays a flag link' do
      expect(page).to have_xpath("//a[@href = '/flaggings/new?resource_id=#{post.id}&resource_type=Post']")
    end

    context 'clicked flag link' do

      before do
        click_link('Report')
      end

      it 'displays modal with flags#form' do
        expect(page).to have_css("#Post#{post.id}")
      end

      context 'submitted flags#form' do

        before do
          within("#Post#{post.id}") do
            fill_in 'flagging_description', :with => 'This is inappropriate'
            click_on 'Report content'
          end
        end

        it 'displays thanks message and create flag' do
          modal_body = find(:css, "#Post#{post.id} .modal-body")
          expect(modal_body).to have_content('Thanks for telling us!')
          expect(Flag.where(:resource_type => 'Post', :resource_id => post.id)).to exist
          flag = Flag.where(:resource_type => 'Post', :resource_id => post.id).first
          puts flag.flaggings.first.inspect
          expect(flag.flaggings.where(:description => 'This is inappropriate', :user_id => user.id)).to exist
        end

      end

    end

  end

end
