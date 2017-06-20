class Upload

  attr_reader :data

  def initialize(string)
    @data = parse_file(string).data
  end

  private

  def parse_file(string)
    case string
    when /,/  then CommaSeparatedFile.new(string)
    when /\|/ then PipeSeparatedFile.new(string)
    else           SpaceSeparatedFile.new(string)
    end
  end

end
