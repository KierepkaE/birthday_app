require_relative '../../app.rb'


feature 'testing birthday app' do

  scenario 'user can input his name on the website' do
    visit('/')
    fill_in :name, with: "John"
    click_button "Send"
    expect(page).to have_content "John"
  end

  # scenario 'user can input his birthday date on the website' do
  #   visit('/')
  #   fill_in :name, with: "John"
  #   select_date("1990,April,8", :from => "birthday_date")
  #   click_button "Send"
  #   expect(page).to have_content "John"
  # end
end