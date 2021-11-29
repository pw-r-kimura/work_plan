require 'date'

class Calendar
  class << self
    # とりあえず指定日を入れる
    def work_definition(workers, year ,month)
      calendar = Calendar.new
      calendar_hash = calendar.make_calendar(year, month)
      workers.each do |worker|
        worker.rest_days.each do |rest_day|
          calendar_key = sprintf("%04d-%02d-%02d", year, month, rest_day)
          calendar_hash[calendar_key][:names] << worker.name
          calendar_hash[calendar_key][:count] += 1
        end
      end
      calendar_hash
    end
  end

  # 指定された年月のカレンダー作成
  def make_calendar(year, month)
    calendar_hash = Hash.new
    design_date = Date.new(year, month, 1)
    first_day = Date.new(year, month, 1).day.to_i
    last_day = Date.new(year, month, -1).day.to_i
    limit = last_day - first_day
    design_date.step(design_date + limit ,1) do |date|
      calendar_key = sprintf("%04d-%02d-%02d", date.year, date.month, date.day)
      calendar_hash[calendar_key] = { names: [] , count: 0 }
    end
    calendar_hash
  end
end


