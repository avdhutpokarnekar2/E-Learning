# frozen_string_literal: true

# a =5
# b =10
# while (a<10 || b<20)&&true
# 	puts a*b
# 	a+=2
# 	b+=2
# end

# s = ["a","e","i","o","u"]
# s.shift
# p s

# class Greet
# 	def gr.hello
# 		"helo"
# 	end
# end
# Greet.singletone_methods.include?(:hello)

def sol(n, num, tnum)
  max_score = 0
  (0..(n - 1)).each do |i|
    (i..(n - 1)).each do |j|
      bitwise_and = num[i]
      (i + 1..j).each do |k|
        bitwise_and &= num[k]
      end
      score = (tnum - bitwise_and).abs
      max_score = score if score > max_score
      return max_score
    end
  end
end

n = 4
num = [9, 12, 3, 15]
tnum = 5
ans = sol(n, num, tnum)
puts ans
