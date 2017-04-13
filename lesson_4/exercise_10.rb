munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |_,value|
  if value["age"] < 18
    value["age_group"] = "kid"
  elsif value["age"] > 100
    value["age_group"] = "senior"
  else
    value["age_group"] = "adult"
  end
end

p munsters
