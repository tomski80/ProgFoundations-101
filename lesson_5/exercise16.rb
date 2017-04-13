def generate_uuid()
  char_sample = %w( 0 1 2 3 4 5 6 7 8 9 a b c d e f )
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each do |len|
    len.times { uuid << char_sample.sample }
    uuid << '-' unless len == 12
  end
  uuid
end

p generate_uuid
