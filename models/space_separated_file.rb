class SpaceSeparatedFile < SeparatedFile

  private

  def line_values(line)
    values = line.split(" ")
    {
      first_name:     values[0],
      last_name:      values[1],
      middle_initial: values[2],
      pet:            pet(values[3]),
      birthday:       Chronic.parse(values[4]),
      color:          values[5]
    }
  end

  def pet(char)
    case char
    when "B" then "Both"
    when "C" then "Cat"
    when "D" then "Dog"
    when "N" then "None"
    end
  end

end
