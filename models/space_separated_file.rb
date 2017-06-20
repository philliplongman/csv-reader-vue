class SpaceSeparatedFile < SeparatedFile

  private

  def line_values(line)
    values = line.split(" ")
    {
      first_name:     values[0],
      last_name:      values[1],
      middle_initial: values[2],
      pet:            values[3],
      birthday:       values[4],
      color:          values[5]
    }
  end

end
