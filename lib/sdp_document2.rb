# coding: UTF-8

require 'pry'
require 'json'
require_relative './my_ex_workbook'

class SdpDocument2

  def write(data, _output_path=nil)
    _output_path ||= get_output_path()
    FileUtils.cp source_path(), _output_path
    exwb = MyExWorkbook.new(_output_path)
    _d = JSON.parse(data) if data.class == String
    puts _d
    puts _d.class
    exwb.named_ranges.each do |k, v|
      puts k
      puts v
      if _d.has_key?(k) 
        puts _d[k]['value']
        puts exwb.cell(v)
        exwb.cell(v).change_contents _d[k]['value']
      end
    end

    exwb.save
    return File.basename(_output_path)
  end
end
