# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

@words = @n.times.map { gets.chomp }

require 'set'

LETTERS = 'abcdefghijklmnopqrstuvwxyz'.split('')

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

def edits(word)
  splits = (0..word.length).map { |i| [word[0..(i-1)], word[i..-1]] }
  splits[0][0] = ''
  # =>[["hello", "hello"], ["h", "ello"], ["he", "llo"], ["hel", "lo"], ["hell", "o"], ["hello", ""]]
  
  deletes = splits.map { |l, r| l + r[1..-1] if !r.empty? }.compact
  replaces = splits.map {|l,r| LETTERS.map { |c| l + c + r[1..-1] if !r.empty? } }.flatten.compact
  inserts = splits.map {|l,r| LETTERS.map { |c| l + c + r } }.flatten.compact
  Set.new(deletes + replaces + inserts)
end

def palindrome?(word)
  word == word.reverse
end

def near_palindrome?(word)
  edits(word).any? { |edited| palindrome?(edited) }
end

puts @words.map { |word| near_palindrome?(word) ? 1 : 0 }.join('')