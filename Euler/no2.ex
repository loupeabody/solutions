# Euler Problem 2, "Even Fibonacci Numbers"

# recursively sum the even Fibonacci numbers
# smaller than 4,000,000

defmodule Fibonacci do
	def sumEven(a,b,sum) do
		c = a + b
		IO.puts c
		case c do
			c when (rem(c,2) == 0) and (c < 4000000) ->
				here = sum + c
				sumEven(b,c,here)
			c when (rem(c,2) !== 0) and (c < 4000000) ->
				sumEven(b,c,sum)
			c when (c > 4000000) ->
				IO.puts "sum: #{sum}"
		end
	end
end

Fibonacci.sumEven(0,1,0)

# 4613732