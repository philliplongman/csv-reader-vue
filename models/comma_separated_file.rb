class CommaSeparatedFile < SeparatedFile

  private

  def line_values(line)
    values = line.split(",")
    {
      last_name:  values[0],
      first_name: values[1],
      pet:        values[2],
      color:      values[3],
      birthday:   Chronic.parse(values[4])
    }
  end

end
