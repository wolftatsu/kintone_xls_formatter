# coding: UTF-8
require_relative './sdp_document'

class SdpPayment < SdpDocument

  attr_accessor :payment_to, :plant_name, :work_name, :payment_from, :payment_date, :payment, :order_id

  def source_path
    "/app/asset/source_payment.xlsx"
  end

  def cells
    # (4..10).map { |e| "C#{e}" }
    ['C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10']
  end

  def instance_variable_get(obj)
    case obj
    when '@payment_date'
      super(obj).gsub('-','/') unless super(obj).nil?
    else
      super(obj)
    end
  end

  def get_output_path
    now = Time.now.strftime('%Y%m%d%H%M%s')
    file_path = "/tmp/#{now}_payment.xlsx"
  end

end
