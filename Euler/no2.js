'use strict';

function fib(a,b,sum) {
	var c = a + b,
			sum = sum
	console.log(c)
	if (c % 2 == 0) sum += c
	if (c < 4000000) 
		fib(b,c,sum)
	else
		console.log('sum: ' + sum)
}

fib(0,1,0)

// 4613732