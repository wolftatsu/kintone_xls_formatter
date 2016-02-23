# coding: UTF-8

require 'rubyXL'
require_relative 'row_ext'
require_relative 'my_attributes'
require 'pry'

class SdpDocument
  # include TrackAttribute

  def write(_output_path=nil)
    _output_path ||= get_output_path()
    FileUtils.cp source_path(), _output_path

    worksheet = workbook.worksheets[0]
    extws = RubyXLExt::WS.new(worksheet)

    # set header columns
    attributes.zip(cells()).each do |e|
      extws.cell(e[1]).change_contents instance_variable_get("@#{e[0]}")
    end
    extws.save
    return File.basename(_output_path)
  end

end
