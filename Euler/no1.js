sum = 0

for (i=0;i<1000;i++) {
	if (i % 3 == 0 || i % 5 == 0) {
		console.log(i)
		sum += i
	}
}

console.log(sum)
// 233168