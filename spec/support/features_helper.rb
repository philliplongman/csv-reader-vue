module FeaturesHelper

  def first_value_of(csv_path)
    first_column_of(csv_path).first
  end

  def first_column_of(csv_path)
    lines = File.read(csv_path).split
    lines.map { |line| line.split(/[\s,|]/).first }
  end

  def first_table_cell
    first("table td")
  end

  def click_header(text)
    find("th", text: text).click
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.Capybara.default_max_wait_time) do
      active = page.evaluate_script('jQuery.active')
      active = page.evaluate_script('jQuery.active') until active == 0
    end
  end

end
