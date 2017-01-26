//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// the <T> is generic like as in Array<T>
enum Optional<T> {
    case None
    case Some(T)
}

let x: String? = nil
// =
let x1 = Optional<String>.None


let y: String? = "hello"
//equavlent
let y2 = Optional<String>.Some("hello")

//switch x {
//    case some(let value): y = value
//    //case None //rase an exception
//}

//An Optional is just an enum

if let y = x {
    //do somthing
}

switch x {
    case .some(let y): break
        //do something with y
    case .none: break
}

/*
 Optional can be "chained"
    ex: hashValue is a var in String which is an Int
        What if we wanted to get the hashvalue from something which was an Optional String?
        And what if that Optional String was, itself, contained in an Optional UILabel display?
 */

var display: UILabel? //imagine this is an @IBOutlet without the implicit unwrap !
if let label = display {
    if let text = label.text{
        let x = text.hashValue
    }
}
//...or...
if let x = display?.text?.hashValue{}


//there is also Optional "defaulting" operator ??
//what if we want to put a String into a UILabel, but if it's nil, put " "(space) in the UILabel?

let s: String? = "123" // might be nil

if s != nil {
    display?.text = s
} else {
    display?.text = " "
}

//..can be expressed much more simply 
display?.text = s ?? " "

//Tuples --> type in Swift a grouping of values
let tup:(String, Int, Double) = ("Double" , 5, 0.85)
let (word, number, value) = tup //tuple emlements named when accessing the tuple
print(word)
print(number)
print(value)

//...or 
let tup1:(w: String, i: Int, v:Double) = ("hello", 5, 0.85)
print(tup1.w)
print(tup1.i)
print(tup1.v)

//mix them
let(wrd, num, val) = tup1


//Returning multiple values from a function
func getSize() -> (weight: Double, height: Double) {return (250, 80)}

let a = getSize()
print("weight is \(a.weight)")
print("height is \(a.height)")

//Range (A Range in Swift with two points)
struct Range<T>{
    var startIndex: T
    var endIndex: T
}

//An array's range would be a Range<Int> 
//A String subrange is not Range<Int> (it is Range<String.Index>...)

let array = ["a", "b", "c","d"]
let subArray1 = array[2...3] //["c","d"]
let subArray2 = array[2..<3] //["c"]
for i in 27...104 {} //range is enumeratable, like array, string, dictionary


//Data Structures in Swift (classes, structures and enumerations)
//Classes, structures and Enumerations
//these are the 3 fundamental building blocks of data structures in swift
//这里再讲这三种的相同之处，和不同之处

//Similarities 相同
    //Declaration syntax... 声明
    //Properties and Functions...
    //Initializer(again, not enum)... initialized

//    func doit(argument: Type) -> ReturnValue{
//
//    }
//
//    var storedProperty = <initial value> (not enum)
//
//    var computedProperty: Type{
//        get{}
//        set{}
//    }

//
//init(argument1: Type, arugment2: Type){
//
//}

//            Difference
//            Inheritance(class only) 只有class 可以inheritance
//            value type(struct, enum) vs. Reference type(class)

/* value(struct and enum)
        copied when passed as an argument to a function
        copied when assigned to a different variable 
        Immutable if assigned to a variable with let
        Function parameter are constants
        must note any func that can mutate a struct/enum with the keyword mutating(mutating func...)
*/
/*
    Reference(class)
        stored in the head and reference counted (automatically)
        Constant pointers to a class(let) still can mutate by calling methods and changing properties
 */

func student(name: String) -> String{
    return name
}

print(student(name: "Hello"))
print(student(name: "student"))

//usually chose class over struct
//struct is for small things like rectangle objects...

//            Methods
//Parameters names(all parameters to all functions have an "internal" name and an "external" name)
//internal name is the name of the local variable you use inside the method
//external name is what callers use when they call the method
//This is the default for the first parameter(except in initializers)

func foo(_ first: Int, externalSecond second: Double){
//    var sum = 0.0
//    for _ in 0...<first { sum += second }
}

for bar(){
    let result = foo(123, externalSecond: 5.5)
}








