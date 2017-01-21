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
//these are the 3 fundamental building blocks of data structures in swift

//Similarities
    //Declaration syntax...
    //Properties and Functions...

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








