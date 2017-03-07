@n = gets.to_i
@words = @n.times.map { gets.chomp }

LETTERS = 'abcdefghijklmnopqrstuvwxyz'.split('')

# Inspired by: http://norvig.com/spell-correct.html

def palindrome?(word)
  word == word.reverse
end

def near_palindrome?(word)
  splits = (0..word.length).map { |i| [word[0..(i-1)], word[i..-1]] }
  splits[0][0] = ''

  # => [["", "hello"], ["h", "ello"], ["he", "llo"], ["hel", "lo"], ["hell", "o"], ["hello", ""]]

  splits.each do |l, r|
    return true if !r.empty? && palindrome?(l + r[1..-1]) # test deletion

    LETTERS.each do |c|
      return true if palindrome?(l + c + r) # test insertion
      return true if !r.empty? && palindrome?(l + c + r[1..-1]) # test replacement
    end
  end

  false
end

puts @words.map { |word| near_palindrome?(word) ? 1 : 0 }.join('')