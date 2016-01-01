function ackermann( x, y ) {

  if ( y === 0 ) {

    return 0;

  } else if ( x === 0 ) {

    console.log( y * 2 );
    return ( y * 2 );

  } else if ( y === 1 ) {

    return 2; 

  } else { 

    // console.log(ackermann( (x - 1), (ackermann( x, ( y - 1 )))));
    return ackermann( (x - 1), (ackermann( x, ( y - 1 ))));

  }
}

ackermann(3,3);
console.log();
ackermann(2,4);