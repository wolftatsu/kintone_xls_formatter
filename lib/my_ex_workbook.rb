# Extended RubyXL's workbook object
require 'rubyXL'
require 'pry'

class MyExWorkbook
  attr_accessor :file_path, :workbook, :worksheet

  def initialize(file_path)
    @file_path = file_path
    @workbook = RubyXL::Parser.parse(@file_path)
  end

  def save()
    @workbook.calc_pr.full_calc_on_load = true
    @workbook.calc_pr.calc_completed = true
    @workbook.calc_pr.calc_on_save = true
    @workbook.calc_pr.force_full_calc = true
    @workbook.write
  end

  def named_ranges()
    return @workbook.defined_names.each_with_object({}) do |e, o|
      o[e.name] = convert_cell_addr(e.reference)
    end
  end

  private

  def convert_cell_addr(abs_path)
    items = abs_path.scan(/.*!(.*)$/)
    throw if items.size == 0
    return items.flatten[0].gsub('$', '')
  end

end
