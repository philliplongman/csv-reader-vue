describe Upload do

  let(:comma) { "spec/fixtures/comma.txt" }
  let(:pipe)  { "spec/fixtures/pipe.txt"  }
  let(:space) { "spec/fixtures/space.txt" }

  it "handles three file formats" do
    comma_file = Upload.new "comma.txt", comma
    pipe_file = Upload.new "pipe.txt", pipe
    space_file = Upload.new "space.txt", space

    expect(comma_file.file.class).to be CommaSeparatedFile
    expect(pipe_file.file.class).to be PipeSeparatedFile
    expect(space_file.file.class).to be SpaceSeparatedFile
  end

  describe "#data" do
    it "returns parsed data from the file" do
      upload = Upload.new "comma.txt", comma
      person = upload.data.first
      expect(person.first_name).to eq "Shalonda"
    end
  end

  describe "#to_json" do
    it "return usable JSON" do
      upload = Upload.new "comma.txt", comma
      json = JSON.parse(upload.to_json, symbolize_names: true)

      # Feed json hash into person and then back into hash
      json_person = json[:people].first
      person_hash = Person.new(json_person).to_h

      expect(json[:filename]).to eq upload.filename
      expect(json_person).to eq person_hash
    end
  end


end
