feature "user views csv -" do

  scenario "user views csv files with different seperators" do
    visit "/"
    expect(page).to have_content "Hello world!"
  end

end
