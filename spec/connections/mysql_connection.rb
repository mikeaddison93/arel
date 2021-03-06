require "activerecord"
puts "Using native MySQL"

ActiveRecord::Base.logger = Logger.new("debug.log")

ActiveRecord::Base.configurations = {
  'unit' => {
    :adapter  => 'mysql',
    :username => 'rails',
    :encoding => 'utf8',
    :database => 'arel_unit',
  }
}

ActiveRecord::Base.establish_connection 'unit'
