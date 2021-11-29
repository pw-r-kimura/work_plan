class Worker
  
  attr_accessor :name, :rest_days, :holiday

  def initialize(name: "",rest_days: [], holiday: 0)
    @name = name
    @rest_days = rest_days
    @holiday = holiday
  end

  def worker_valid?
    raise 'name is invalid' unless self.name =~ /\w+/
    raise 'rest_days' unless self.rest_days.to_a? Array
  end

end
