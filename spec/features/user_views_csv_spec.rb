feature "user views csv -" do

  let(:commas) { "spec/fixtures/comma.txt" }
  let(:pipes)  { "spec/fixtures/pipe.txt"  }
  let(:spaces) { "spec/fixtures/space.txt" }
  let(:empty)  { "spec/fixtures/empty.txt" }

  scenario "user views csv files with different seperators" do
    visit "/"

    attach_file "Import a file", commas
    expect(page).to have_content first_value_of(commas)

    attach_file "Import a file", pipes
    expect(page).to have_content first_value_of(pipes)

    attach_file "Import a file", spaces
    expect(page).to have_content first_value_of(spaces)
  end

  scenario "user sorts the table" do
    visit "/"
    attach_file "Import a file", commas

    last_names = first_column_of commas

    # start alphabetical order
    click_header "Last name"
    expect(first_table_cell).to have_content last_names.sort.reverse.first

    # reverse alphabetical order
    click_header "Last name"
    expect(first_table_cell).to have_content last_names.sort.first
  end

end
