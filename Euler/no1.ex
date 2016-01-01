# Euler Problem 1, "Multiples of 3 and 5"

# recursively sum the multiples of 3 and 5 
defmodule Multiples do
	def sumMultiples(x,sum) do
		case x do
			x when (rem(x,3) == 0 or rem(x,5) == 0) and (x !== 0) ->
				sumMultiples(x - 1,sum + x)
			x when (rem(x,3) !== 0 or rem(x,5) !== 0) and (x !== 0) ->
				sumMultiples(x - 1,sum)
			x when x == 0 -> IO.puts sum
		end
	end
end

Multiples.sumMultiples(999,0)
# 233168