hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


arr = hsh.map do |name,attributs|
  if attributs[:type] == 'fruit'
    atr = attributs[:colors]
    atr.map! { |color| color.capitalize }
    atr
  else
    attributs[:size].upcase
  end
end

p arr
