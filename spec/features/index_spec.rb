require_relative '../../app.rb'


feature 'testing birthday app' do
  scenario 'user can input his name on the website' do
    visit('/')
    fill_in :name, with: "John"
    click_button "Send"
    expect(page).to have_content "John"
  end
end