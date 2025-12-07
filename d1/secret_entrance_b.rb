INPUT = File.readlines("input", chomp: true).map do |line|
  { dir: line[0], dist: line[1..].to_i }
end
position = 50
code = 0

def dial(pos, change)
    new_pos = change[:dir] == 'R' ? pos + change[:dist] : pos - change[:dist]

    code_change = change[:dir] == 'R' ? (new_pos/100) - (pos/100) : ((pos-1)/100) - ((new_pos-1)/100)

    { pos: new_pos, code_change: }
end

INPUT.each do |change|
    update = dial(position, change)
    position = update[:pos]
    code += update[:code_change]
end

puts code