feature "user views csv -" do

  let(:comma) { "spec/fixtures/comma.txt" }
  let(:pipe)  { "spec/fixtures/pipe.txt"  }
  let(:space) { "spec/fixtures/space.txt" }

  scenario "user views csv files with different seperators" do
    visit "/"

    attach_file "Import a file", comma , make_visible: true
    expect(page).to have_content first_value_of(comma)
    expect(page).to have_content "3 people"
    expect(page).to have_content "comma.txt"

    attach_file "Import a file", pipe , make_visible: true
    expect(page).to have_content first_value_of(pipe)
    expect(page).to have_content "pipe.txt"

    attach_file "Import a file", space , make_visible: true
    expect(page).to have_content first_value_of(space)
    expect(page).to have_content "space.txt"
  end

  scenario "user sorts the table" do
    last_names = first_column_of comma

    visit "/"

    # start in alphabetical order
    attach_file "Import a file", comma , make_visible: true

    expect(first("table td")).to have_content last_names.sort.first

    click_header "Last name"
    expect(first_table_cell).to have_content last_names.sort.reverse.first

    click_header "Last name"
    expect(first_table_cell).to have_content last_names.sort.first
  end

end
