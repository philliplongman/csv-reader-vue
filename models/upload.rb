class Upload

  attr_reader :file, :filename

  def initialize(filename, file)
    @filename = filename
    @file = file_by_delimiter(File.read file)
  end

  def data
    @data ||= file.data
  end

  def to_h
    {
      filename: filename,
      people: data.map { |person| person.to_h  }
    }
  end

  def to_json
    to_h.to_json
  end

  private

  def file_by_delimiter(string)
    case string
    when /,/
      CommaSeparatedFile.new(string)
    when /\|/
      PipeSeparatedFile.new(string)
    else
      SpaceSeparatedFile.new(string)
    end
  end

end
