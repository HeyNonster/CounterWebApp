class ProcessCountFile
  def initialize(file)
    @csv_text = file
    @csv = CSV.read(@csv_text, :headers => true)
    @phones =  Hash.new { |hash, key| hash[key] = Array.new }
    @counts = Hash.new { |hash, key| hash[key] = 0 }
    @csv.each do |row|
      process_row(row["_ws.col.Source"], DateTime.parse(row["frame.time"]))
    end
  end

  def phones
    @phones
  end

  def process_row(phone, time)
    @phones[phone].push(time)
  end

  def duration_filter(filter)
    @matches = Array.new
    @phones.keys.each do |phone|
      if @phones[phone].length > 1
         if (@phones[phone].last.to_i - @phones[phone].first.to_i)/60 >= filter
           @matches.push(phone)
         end
      end
    end
    @matches
  end

  def unique_customers
    @matches.length
  end

  def map_minutes(time)
    duration_filter(time).each do |match|
      @start = @phones[match].first
      @duration = (@phones[match].last.to_i - @start.to_i)/60
      (0..@duration).each do |minute|
        @counts[(@start+(60*minute).seconds).strftime('%H:%M')] += 1
      end
    end
    @counts
  end
end
