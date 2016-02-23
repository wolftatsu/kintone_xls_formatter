# -*- coding: utf-8 -*-
require 'sinatra'
require 'sinatra/cross_origin'
require_relative 'lib/sdp_order'
require_relative 'lib/sdp_payment'

configure do
  enable :cross_origin
end
set :allow_origin, :any

get '/' do
  "Hello, world"
end

post '/sdp_order' do
  # puts params
  rec = params[:record]
  # puts '[log] called sdp_order!!!'

  # create column name list
  cols = ['order_id','order_date','dest','work_name','place','construction_start','construction_end']
  cols.concat ['source_name', 'source_addr1', 'source_addr2', 'source_telno', 'source_faxno']
  order = SdpOrder.new()

  # set value
  cols.each do |c|
    order.instance_variable_set("@#{c}", rec[c]['value'])
  end

  order.write
  return '/download'
end

post '/sdp_payment' do
  rec = params[:record]
  cols = ['order_id', 'plant_name', 'work_name', 'payment_to', 'payment_from', 'payment_date', 'payment']
  payment = SdpPayment.new()
  cols.each do |c|
    payment.instance_variable_set("@#{c}", rec[c]['value'])
  end
  file_name = payment.write
  return "/download/#{file_name}"
end

get '/download/:target' do
  file_path = "/tmp/#{params[:target]}"
  send_file(file_path) if File.exists?(file_path)
end
