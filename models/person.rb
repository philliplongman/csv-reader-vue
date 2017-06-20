class Person

  attr_reader :birthday, :color, :first_name, :last_name, :middle_initial, :pet

  def initialize(**options)
    @first_name     = options[:first_name]
    @middle_initial = options[:middle_initial]
    @last_name      = options[:last_name]
    @pet            = options[:pet]
    @birthday       = options[:birthday]
    @color          = options[:color]
  end

  def to_h
    {
      first_name:     first_name,
      middle_initial: middle_initial,
      last_name:      last_name,
      pet:            pet,
      birthday:       birthday,
      color:          color
    }
  end

  def to_s
    to_h.to_s
  end

end
