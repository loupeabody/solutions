function sqrt_iter( guess, x ) {
  if ( isGoodEnough( guess, x ) ) {
    console.log(x + " : " + guess * guess);
    return guess;
  } else { 
    console.log( "i: " + improve( guess, x ) ); 
    return sqrt_iter( improve( guess, x ), x ); 
  }
}

function improve( guess, x ) {
  return average( guess, ( x / guess ) );
}

function average( x, y ) {
  return ( x + y ) / 2;
}

function isGoodEnough( guess, x ) {
  return Math.abs( ( guess * guess ) - x ) < 0.001;
}

function sqrt( x ) {
  return sqrt_iter( 1.0, x );
}

// sqrt(0.0081);
// console.log();
// sqrt(30000000000);


function stepTest( guess, lastguess ) {
  return ( ( Math.abs( lastguess - guess ) ) < ( guess / 100000 ) );
}

function sqrt_iter( guess, x, lastguess) {
  if ( stepTest( guess, lastguess ) ) {
    console.log( "g: " + guess ); 
    console.log( x + " : " + guess * guess );
    return guess;
  } else {
    console.log( "i: " + improve( guess, x ) ); 
    return sqrt_iter( improve( guess, x ), x, guess ); 
  }
}

function sqrt( x ) {
  return sqrt_iter( 1.0, x, x );
}

// sqrt(0.0081);
// console.log();
// sqrt(30000000000);