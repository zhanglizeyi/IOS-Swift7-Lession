# IOS-Developer-Lession

MVC - Model Controller View

Model = what the application is how is display
Controller = how you model is presented to the user(UI logic)
View = your controller is minions

	/,\ you can cross , |||| you cann't
1. controller can always talke directly to their model
2. controller can also talk directly to their view
3. The model and view should never speak to each other
4. all the minions in it are generic object, limited( yes or no )
5. view needs to synchronized with controller, the controller sets itself as the view delegate

                    Controller(target)(outlet)(delegate)(datasource)
			/\
		       /  \
		      /    \
		model  ||||  View(action) (should, will, did)

6. controller interpret/format Model information for the view 
7. Model cannot talk to controller..contoller is UI logic and model is UI indepandent!
8. model (radio station) notification & KVO  


CLASS:  pass by refrence -> means that thing live in the heap, pass around like pass a pointer, everyone share it

STRUCT almost like class, like enum pass by value. Copy from origin, swift makes it smart IF YOU ARE NOT TOUCH Value, IT WON'T COPY THEM. 

If enum define cases type, then the function can be using 
keyword(op1: Double, op2: Double)->Double{return op1*op2}
reduce: keyword(op1,op2) return op1*op2
reduce: op1*op2 
reduce: $0*$1    register vars

VIEW: editor -> embed in -> stack view 
 1. row to row 
 2. column to column 
 3. all together
 4. stablized the top, leading, right, bottom gap

Lecture 3:
	Optional
    enum Optional<T> {// the <T> is a generic like as in Array<T>
	case None
	case Some<T>
    }

let x: String? = nil  <=>  let x = Optional<String>.None
let x:String? = "hello" <=> let x = Optional<String>.Some<"hello">

An Optional is just an enum

Optional can be "chained" -> For example: 
	if a hashValue is a var in string which is an int, and wnat to get the hashvalue from something which was an optional string? and what if that optional string was, contained in an optional UILabel display? 

	var display: UILabel? //this is an @IBOutlet without the implicit unwrap!
	if let label = display{
		if let text = label.text{
			let x = text.hashValue
			...
		}
	}	

or 
if let x = display?.text?.hashValue{...}

There is also an optional "defaulting" ??

	display.text = s ?? " "      -> if not equal s then  " "

What is a tuple? can use it anywhere
	let x:(String, Int, Double) = ("hello", 5, 0.85)
	let (word, number, value) = x //tuple elements named when accessing the tuple
	print(word) //prints hello
	print(number) //print 5
	print(value) //print 0.85
OR
	let x:(w: String, i: Int, v: Double) = ("hello", 5, 0.85)
	print(x.w) //prints hello
	print(x.i) //prints 5
	print(x.v) //prints 0.85
	let (wrd, num, val) = x //this is also legal(renames the tuple elemts on access)

For tuple, you can either call it with . to call inside element
or
let val = tuple then call by val.tuple's element
===========================================================
Range is generic like an array
	Range in swift just two end points, array would be Range<Int>



