class UploadController < ApplicationController
  require 'csv'
  require 'process-count'
  def index
    # CSV column headers
    # frame.number,frame.time,_ws.col.Source,_ws.col.Destination,_ws.col.Protocol
  end

  def results
    @file = Count.new()
    @file.count_file = params[:upload][:datafile]
    @minute = params[:minute][:minute].to_i
    @process = ProcessCountFile.new(@file.count_file)
    @results = @process.map_minutes(@minute)
  end
end
