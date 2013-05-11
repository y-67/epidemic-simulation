arr = Array.new()

counter = 0
File.open("polp00ag.asc", "r") do |infile|
    while (line = infile.gets)
      if counter > 5
        values = line.split(" ")
        # omit empty rows but leave 2 untact (to have number of rows nicely divided by 4)
        if values.all? {|n| n.to_i == 0} && counter > 7
          #puts counter - 5
        else
          arr << values.map { |n| n.to_f }
        end
      end
      counter = counter + 1
    end
end

puts arr.size
puts arr[10].size
output = Array.new()
row_divider = 4
col_divider = 8

(0...(arr.size)).to_a.each do |row|
  if row % row_divider == 0
    (0...(arr[0].size)).to_a.each do |col|
      if col % col_divider == 0
        sum_square = 0
        (row...(row+row_divider)).to_a.each do |i|
          (col...(col+col_divider)).to_a.each do |j|
            if arr[i] && arr[i][j]
              sum_square += arr[i][j]
            end
          end
        end
        row_ind = row/row_divider
        col_ind = col/col_divider
        unless output[row_ind]
          output[row_ind] = []
        end
        #puts row_ind
        #puts col_ind
        #puts output
        output[row_ind][col_ind] = sum_square.round
      end
    end
  end
end


def sum_arr (arr)
  sum = 0
  (0...(arr.size)).to_a.each do |row|
    (0...(arr[row].size)).to_a.each do |col|
      #if arr[row] && arr[row][col]
      sum += arr[row][col]
      #end
    end
  end
  sum
end

def export_to_json( arr )
  counter = 0
  (0...(arr.size)).to_a.each do |row|
    (0...(arr[row].size)).to_a.each do |col|
      puts counter.to_i.to_s + ": " + arr[row][col].to_s + ", "
      counter += 1
    end
  end
end


puts "sum: " + sum_arr(output).to_s

puts output.size
puts output[0].size

export_to_json output

