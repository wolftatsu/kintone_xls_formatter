# coding: UTF-8
require_relative './sdp_document'

class SdpPayment < SdpDocument

  attr_accessor :order_id, :order_date, :dest, :work_name, :place, :construction_start, :construction_end, :source_name, :source_addr1, :source_addr2, :source_telno, :source_faxno

  def source_path
    "/app/asset/source.xlsx"
  end

  def get_output_path
    now = Time.now.strftime('%Y%m%d%H%M%s')
    file_path = "/tmp/#{now}_order.xlsx"
  end

  # convert attribute
  def instance_variable_get(obj)
    case obj
    when '@dest'
      super(obj) + '  御中'
    when '@construction_start', '@construction_end', 'order_date'
      super(obj).gsub('-','/') unless super(obj).nil?
    else
      super(obj)
    end
  end

end
