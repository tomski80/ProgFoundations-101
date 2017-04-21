# time represented in minutes before or after midnight
#
# after midnight if time is positive
# before midnght if time is negative
#
# time is 00:00 + minutes (after midnight) ,
# or time is 1440 + (- minutes) (before midnight)
#
# 24*60 = 1440 minutes
MINUTES_PER_DAY = 1440 # 24*60
MINUTES_PER_HOUR = 60

def time_of_day(integer)
    time = MINUTES_PER_DAY + integer    #this is 24:00 (in minutes) + integer
    days, reminder = time.divmod(MINUTES_PER_DAY)
    hours, minutes = reminder.divmod(MINUTES_PER_HOUR)

    hours = hours.to_s
    minutes = minutes.to_s
    hours.prepend('0') if hours.size == 1
    minutes.prepend('0') if minutes.size == 1
    hours+':'+minutes
end

# method takes as an argument time of the day in 24:00 hour format
# and return minutes after midnight
# so we have HH:MM
# we need to convert HH to minutes and sum it up with MM
# that will be our return value
# hours to minutes:
# HH*60 = minutes
def after_midnight(time)
  time_arr = time.split(':')
  hour = time_arr[0].to_i
  minutes = time_arr[1].to_i
  if hour == 24 && minutes == 0
    0
  else
    minutes = minutes + ( hour * MINUTES_PER_HOUR )
  end
end

def before_midnight(time)
  time_arr = time.split(':')
  hour = time_arr[0].to_i
  minutes = time_arr[1].to_i
  if hour == 0 && minutes == 0
    0
  else
    minutes = MINUTES_PER_DAY - minutes - ( hour * MINUTES_PER_HOUR )
  end
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
