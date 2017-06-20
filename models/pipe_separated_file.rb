class PipeSeparatedFile < SeparatedFile

  private

  def line_values(line)
    values = line.split("|")
    {
      last_name:      values[0],
      first_name:     values[1],
      middle_initial: values[2],
      pet:            values[3],
      color:          values[4],
      birthday:       Chronic.parse(values[5])
    }
  end

end
