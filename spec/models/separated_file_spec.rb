describe SeparatedFile do

  let(:file) { "spec/fixtures/comma.txt" }

  describe "#data" do
    it "returns an array of Persons" do
      upload = Upload.new "comma.txt", file
      data = upload.data
      expect(data.map(&:class)).to eq [Person]*3
    end
  end

end
