require "csv"
csv = CSV.read('input.csv')
answer = 0

ranges = csv.flatten.map do |range|
    a, b = range.split('-').map(&:to_i)
    {a:,b:,}
end

def false_ids(range) 
    sum = 0
    for i in(range[:a]..range[:b])
        si = i.to_s
        next unless si.size.even?

        sep = si.size/2
        sum += i if si[0..sep-1] == si[sep..-1]
    end
    sum
end

ranges.each do |range|
    answer += false_ids(range)
end

puts answer

