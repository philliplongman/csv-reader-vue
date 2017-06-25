class SeparatedFile

  def initialize(string)
    @lines = string.split("\n")
  end

  def data
    @data ||= lines.map { |e| Person.new line_values(e) }
  end

  private

  attr_reader :lines

end
