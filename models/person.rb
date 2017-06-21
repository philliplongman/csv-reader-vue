class Person

  attr_reader :birthday, :color, :first_name, :last_name, :middle_initial, :pet

  def initialize(**options)
    @first_name     = options[:first_name] || ""
    @middle_initial = options[:middle_initial] || ""
    @last_name      = options[:last_name] || ""
    @pet            = parse_pet(options[:pet]) || "None"
    @birthday       = Chronic.parse(options[:birthday]) || ""
    @color          = options[:color] || ""
  end

  def to_h
    {
      first_name:     first_name,
      middle_initial: middle_initial,
      last_name:      last_name,
      pet:            pet,
      birthday:       birthday.strftime("%-m/%-d/%Y"),
      color:          color
    }
  end

  private

  def parse_pet(string)
    case string
    when "B", "Both" then "Both"
    when "C", "Cat"  then "Cat"
    when "D", "Dog"  then "Dog"
    end
  end

end
