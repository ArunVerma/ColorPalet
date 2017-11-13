puts 'Seeding data ....'
puts 'Creating Colors....'
color_hash = {'#fefa27' => 'Yellow', '#509916' => 'Green', '#00b2f0' => 'Blue', '#7c2583' => 'Plum', '#752a8f' => 'Purple', '#00000' => 'Black'}
colors = []
color_hash.each do |key, val|
  colors << Color.new(name: val, hex_code: key)
end
Color.import! colors
puts '.. Done ..'

puts 'Creating grid cells....'
cells = []
for i in 1..20
  for j in 1..20
    cells << GridSquare.new(cell_id: "#{i}#{j}")
  end
end
GridSquare.import! cells
puts '.. Done..'
puts 'Seeding Done !!!'
