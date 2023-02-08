// Difference Between VARIABLE var and let
var use;
var camper = "James";
var camper = "David";
console.log(camper);
// value of the camper will be David
let use;
let camper = "James";
let camper = "David";
ERROR //will be the OUTPUT because you cannot decalare a variable twice withe the "let";


single '' vs /;
//you can use single quote to avoid getting it from more complex
const myStr = '<a href="http://www.example.com" target="_blank">Link</a>';
console.log(myStr);
\'	single quote
\"	double quote
\\	backslash
\n	newline
\t	tab
\r	carriage return
\b	word boundary
\f	form feed

//type coersion
Number num = 1;
String str = '2';

// Explicit type conversion
Number total = num + str.ToNumber(); // 3

// Implicit type coercion
Number total = num + str;

alert( "not a number" / 2 ); // NaN, such division is erroneous

// Matrix or multidimensional array
const myArray = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [[10, 11, 12], 13, 14],
];

const myData = myArray[2][1];

//for accessing 8 from the matrix
