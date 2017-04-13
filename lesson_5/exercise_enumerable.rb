arr1 = [1, [2, 3], 4]

arr1.map! do |el|
  unless el.respond_to?('map')
    el = 4 if el == 3
    el 
  else
    el.map do |e|
      if e == 3
        e = 4
      else
        e
      end
    end
  end
end

p arr1
