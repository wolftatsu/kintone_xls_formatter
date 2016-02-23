# coding: UTF-8

require 'pry'
require_relative './my_ex_workbook'

class SdpDocument
  # include TrackAttribute

  def write(_output_path=nil)
    _output_path ||= get_output_path()
    FileUtils.cp source_path(), _output_path
    exwb = MyExWorkbook(_output_path)

    exwb.named_ranges.each do |k, v|
      exwb.cell(v).change_contents instance_variable_get("@#{k}")
    end

    extwb.save
    return File.basename(_output_path)
  end

end
