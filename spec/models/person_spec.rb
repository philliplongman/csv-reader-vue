describe Person do

  it "accepts two pet formats and returns the full word" do
    cat_person = Person.new pet: "C"
    dog_person = Person.new pet: "Dog"

    expect(cat_person.pet).to eq "Cat"
    expect(dog_person.pet).to eq "Dog"
  end

  describe "#to_h" do
    it "converts birthday to ISO string format, if there is one" do
      born = Person.new birthday: "3/15/2012"
      unborn = Person.new

      expect(born.to_h[:birthday]).to eq "2012-03-15"
      expect(unborn.to_h[:birthday]).to be nil
    end
  end

end
