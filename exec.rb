require "./lib/calendar"
require "./lib/worker"

# 入力値にする予定
hard_coding = [
  { name: "Rintaro", rest_days: [3,10,28] },
  { name: "Taichiro", rest_days: [1,8,22] },
]

# 勤務者情報を配列にする
workers = Array.new
hard_coding.each do |worker|
  workers << Worker.new(name: worker[:name], rest_days: worker[:rest_days])
end

# これも入力値にする
year = 2021
month = 2

# 勤務者情報をループさせる(とりあえず指定日を入れる)
calendar_hash = Calendar.work_definition(workers, year, month)
p calendar_hash
