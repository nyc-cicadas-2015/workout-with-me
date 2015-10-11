# require 'rails_helper'

# describe 'possible match page' do

#   let(:log_me_in) {
#     @user = create(:user)
#     @user.activities.create(name:"Lifting")
#     visit root_path
#     click_link "Login Here"
#     fill_in 'Email', :with => @user.email
#     fill_in 'Password', :with => @user.password
#     click_button 'Login'
#   }

#   let(:potential_user) { create(:potential_user) }
#   let(:matched_user) { create(:potential_user2) }
#   let(:unmatched_user) { unmatched_user = create(:unmatched_user) }
#   let(:potential_users) {[potential_user, matched_user]}

#   before(:each) do
#     potential_user.activities.create(name: "Lifting")
#     matched_user.activities.create(name: "Lifting")
#     log_me_in
#   end

#   it 'page contains potential user on the page' do
#     visit match_path(potential_user)
#     expect(page).to have_content potential_user.name
#   end

#   it 'page contains a see more button ' do
#     visit match_path(potential_user)
#     expect(page).to have_content "See more"
#   end

#   it 'page redirects to correct page when clicking See more link' do
#     visit match_path(potential_user)
#     click_link "See more"
#     expect(page).to have_content "Profile page"
#   end

#   it 'page redirects to the next user if liked clicked' do
#     visit match_path(potential_user)
#     click_button "LIKE"
#     expect(page).to_not have_content potential_user.name
#   end

#   it "should flash message if matched" do
#     Match.create(initiator_id: matched_user.id, responder_id: @user.id)
#     visit match_path(matched_user)
#     click_button "LIKE"
#     expect(page).to have_content "You've been matched!"
#   end
# end

# describe 'user matches page' do
#   it 'shows the matches for a current user' do
#     Match.create(initiator_id: matched_user.id, responder_id: @user.id, accepted: 1)
#     click_link "Matches"
#     expect(page).to have_content "Here are your matches " + @user.name
#   end

#   it 'list a match on the page' do
#     Match.create(initiator_id:@user.id, responder_id: matched_user.id, accepted: 1)
#     click_link "Matches"
#     expect(page).to have_content matched_user.name
#   end
# end

