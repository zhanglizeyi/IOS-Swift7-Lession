<html DOCTYPE>
<html>
<head>
	<h1># IOS-Developer-Lession</h1>
</head>
<body>

<h2>
MVC - Model Controller View

Model = what the application is how is display
Controller = how you model is presented to the user(UI logic)
View = your controller is minions
</h2>

	/,\ you can cross , |||| you cann't
<li>1. controller can always talke directly to their model</li>
<li>2. controller can also talk directly to their view</li>
<li>3. The model and view should never speak to each other</li>
<li>4. all the minions in it are generic object, limited( yes or no )</li>
<li>5. view needs to synchronized with controller, the controller sets itself as the view delegate</li>

                    Controller(target)(outlet)(delegate)(datasource)
			/\
		       /  \
		      /    \
		model  ||||  View(action) (should, will, did)

<li>6. controller interpret/format Model information for the view</li>
<li>7. Model cannot talk to controller..contoller is UI logic and model is UI indepandent!</li>
<li>8. model (radio station) notification & KVO</li>  

<h2>CLASS:  pass by refrence -> means that thing live in the heap, pass around like pass a pointer, everyone share it

STRUCT almost like class, like enum pass by value. Copy from origin, swift makes it smart IF YOU ARE NOT TOUCH Value, IT WON'T COPY THEM.
</h2> 

If enum define cases type, then the function can be using 
keyword(op1: Double, op2: Double)->Double{return op1*op2}
reduce: keyword(op1,op2) return op1*op2
reduce: op1*op2 
reduce: $0*$1    register vars

<h2>VIEW: editor -> embed in -> stack view 
 1. row to row 
 2. column to column 
 3. all together
 4. stablized the top, leading, right, bottom gap
</h2>

<h1>Lecture 3:</h1>
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

<h2> What is a tuple? can use it anywhere</h2>
	let x:(String, Int, Double) = ("hello", 5, 0.85)
	let (word, number, value) = x //tuple elements named when accessing the tuple
	print(word) //prints hello
	print(number) //print 5
	print(value) //print 0.85
<b>OR</b>
	let x:(w: String, i: Int, v: Double) = ("hello", 5, 0.85)
	print(x.w) //prints hello
	print(x.i) //prints 5
	print(x.v) //prints 0.85
	let (wrd, num, val) = x //this is also legal(renames the tuple elemts on access)

<h2>For tuple, you can either call it with . to call inside element
or
let val = tuple then call by val.tuple's element</h2>
===========================================================
Range is generic like an array
	Range in swift just two end points, array would be Range<Int>

example:
	let array = ["a","b","c","d"]
	let subArray = [2...3] //will be ["c","d"]
	let subArray2 = [2..<3] // will be ["c"]
	for i in 27...190 {} //range is enumeratable, like array, string, dictionary
 
<h2>Data Structures in Swift</h2>
<h3>Classes, Structures and Enumerations</h3>
	<p> These 3 fundamental building blocks of data structures in swift
<h3>similarities</h3> 
	class CalculatorBrain{}
	struct Vertex{}
	enum Op{} //can not have store property, can have computed property

<h3>properties and function</h3>
	func doit(arg: Type) -> ReturnValue{}
	var storedProperty = <intial value>(not enum)
	var computedProperty: Type{
		get{}
		set{}
	}
<h3>Difference</h3>
	Inheritance(class only)
	value type(struct, enum) class(pointer)

<h3>Value(struct and enum)</h3>
	<u>copied</u> when passed as an argument to a function
	<u>copied</u> when assigned to a different variable
	<u>Immutable</u> if assigned to a variable with let 
	Remember that function parameters are constants
	You must note any func that mutate a struct/enum with the keyword mutating
<br>
<h3>Reference</h3>
	Stored in the heap and reference counted(automatically)
	Constant pointers to a class(let) still can mutate by calling methods and changing properties

<h2>Method</h2>
<h3>Parameters Names</h3>
   All parameters to all functions have an <u>internal</u> name and an <u>external</u> name
   The internal name is the name of the local val using inside of method
   The external name is what callers use when they call the method
   you can put _ if you don't want callers to use an external name at all for a given parameter
   This is the default for the first parameter(except in initializers!)
   For other(not the first) parameters, the inernal name is, by default, the external name
   Any parameter's external name can be changed

func foo(externalFirst first: Int, externalSecond second: Double){
	var sum = 0.0
	for _ in 0..<first { sum += second }
}
func bar() {
	let result = foo(externalFirst: 123, externalSecond: 5.5)
}

<h3>Override methods/properties in your superclass</h3>
	precede your func or var with the keyword override
	A method can be marked final which will prevent subclasses from being able to override
	class can be final		

<h3>Both types and instances can hvae methods/properties
	var d: Double = ...
	if d.isSignMinus{
		d = Double.abs(d)
	}
 isSignMinus is an instance property of a Double abs is a type method of Double
 you declare a type method or property with a static prefix...
static func abs(d:Double) ->Double

<h3>Property Observers</h3>
	var someStoredProperty: Int =42{
		willSet {newValue is the new value}
		didSet {oldValue is the old value}
	}

	override var inheritedproperty{
		willSet {newValue is the new value}
		didSet {oldValue is the old value}
	}
	
	var operations: Dictionary<string, operation> = [...]{
		willSet { will be executed if an operation is added/removed }
		didSet { will be executed if an operation is added/removed }
	}

<h2>Lazy initialization</h2>
A lazy property does not get initialized until someone accesses it
allocate an object, execute a closure, or call a method if you want
	lazy var brain = Calculatorbrain() // nice if calculatorBrain used lots of resources
	lazy var someProperty: Type = {
		//construct the value of somePerperty here
		return <the constructed value>
	}()
	lazy var myProperty = self.initializeMyProperty()
	This still satisies the "you must initialize all of your properties" rule
	Unfortunatly, things initialized this way can not be constants(var ok, let not ok)
	This can be used to get around some initialization dependency conunderums 

	
	

	


</body>
</html>

