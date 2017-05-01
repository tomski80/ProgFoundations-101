# input is floating point representing angle between 0 - 360
# output is a string DD*MM'SS''


MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60


def dms(angle)
  degrees = angle.to_i
  minutes = ((angle-degrees)*MINUTES_IN_DEGREE).to_i
  seconds = ((((angle-degrees)*MINUTES_IN_DEGREE)-minutes)*SECONDS_IN_MINUTE).to_i
  "%02i°%02i'%02i''" % [degrees, minutes, seconds]
end


# p dms(254.6)
# p dms(93.034773)

#examples
p dms(30)
p dms(76.73)
p dms(254.6)
p dms(93.034773)
p dms(0)
p dms(360)
