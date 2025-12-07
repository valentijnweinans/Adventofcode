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
        unless si.length.even?
            sum += i if si.chars.sort.last == si.chars.sort.first
        else
            binding.irb
            from = si.length/2

            while from > 0 
                chunks = chunk(si, from)
                if chunks.uniq.size == 1
                    sum += i
                end
                from -= 1
            end
        end
    end
    sum
end

def chunk(string, size)
    (0..(string.length - 1) / size).map { |c| string[c * size, size] }
end

ranges.each do |range|
     answer += false_ids(range)
#    binding.irb
end

puts answer
