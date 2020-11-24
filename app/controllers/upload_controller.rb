class UploadController < ApplicationController
  require 'csv'
  require 'process-count'
  def index
    # CSV column headers
    # frame.number,frame.time,_ws.col.Source,_ws.col.Destination,_ws.col.Protocol
    @process = ProcessCountFile.new('../USDA--main--2018-11-25--08-29-52.csv')
  end

  def results
    @file = Count.new()
    @file.count_file = params[:upload][:datafile]
    @process = ProcessCountFile.new(@file.count_file)
  end
end
