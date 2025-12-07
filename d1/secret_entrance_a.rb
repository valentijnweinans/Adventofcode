INPUT = []
position = 50
code = 0

File.open('input').each_with_index do |line, i|
    line = line[0...-1]
    INPUT[i] = { direction: line[0], distance: line[1..-1].to_i }
end

def dial(start, change)
    new_pos = 0;
    direction = change[:direction]
    distance = change[:distance]

    new_pos = direction == 'R' ? start + distance : start - distance
    puts "- the dial is rotated: #{change} to point at: #{new_pos}"
    return new_pos % 100
end

INPUT.each do |change|
    position = dial(position, change)
    code += 1 if position.zero?
end

puts code