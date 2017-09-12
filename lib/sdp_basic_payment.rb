# coding: UTF-8
require_relative './sdp_document2'

class SdpBasicPayment < SdpDocument2

  def source_path
    "/app/asset/source_b_payment.xlsx"
  end

  def get_output_path
    now = Time.now.strftime('%Y%m%d%H%M%s')
    file_path = "/tmp/#{now}_payment.xlsx"
  end

end
