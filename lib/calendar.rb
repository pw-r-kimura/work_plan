require 'date'
class Calendar

  WORK_DAY_LIMIT = 20

  class << self
    def work_definition(workers, year ,month)
      calendar = Calendar.new
      calendar_hash = calendar.make_calendar(year, month)
      workers.each do |worker|
        working_day = [*1..calendar_hash.keys.size].shuffle
        worker.rest_days.each do |rest_day|
          # 指定した休日を除く
          working_day.reject! { |w| w.to_i == rest_day.to_i }
        end
        working_day = working_day.slice(0, WORK_DAY_LIMIT)
        working_day.each do |work|
          calendar_key = sprintf("%04d-%02d-%02d", year, month, work)
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


