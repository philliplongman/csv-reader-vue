class Upload

  attr_reader :file

  def initialize(tempfile)
    @file = file_by_delimiter(File.read tempfile)
  end

  def data
    @data ||= file.data
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
