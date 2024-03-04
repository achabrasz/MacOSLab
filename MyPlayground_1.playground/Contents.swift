import UIKit

//String and text
//zad 1
print("String and text")
print("Zad 1")
var a = 5
var b = 10
print(a ," + ", b, " = ", a+b)

//zad 2
print("Zad 2")
var string = "Gdansk University of Technology"
var string2 = ""
for char in string {
    if (char == "n") {
        string2 = string2 + "⭐️"
    }
    else {
        string2 = string2 + String(char)
    }
}
print(string2)

//zad 3
print("Zad 3")
var name = "Adam Chabraszewski"
var reversed = ""
for char in name {
    reversed = String(char) + reversed
}
print(reversed)


//Control Flow
//zad 1
print()
print("Control Flow")
print("Zad 1")
for i in 1...11 {
    print(i, "I will pass this course with best mark, because swift is great!")
}

//zad 2
print("Zad 2")
for i in 1...5 {
    print(i*i)
}

let N = 5
//zad3
print("Zad 3")
for i in 1...N {
    for j in 1...N {
        print("@", terminator:"")
    }
    print("")
}
print()


//Collection Types
//Arrays
//zad 1
print("Arrays")
print("Zad 1")
var array: [Int] = [5, 10, 20, 15, 80, 13]
print(Int(array.max()!))

//zad 2
print("Zad 2")
array.reverse()
print(array)

//zad 3
print("Zad 3")
var allNumbers: [Int] = [10, 20, 10, 11, 13, 20, 10, 30]
var unique = [Int]()
for i in 1 ... allNumbers.capacity{
    if !unique.contains(allNumbers[i-1]) {
        unique.append(allNumbers[i-1])
    }
}
print(unique)
print()


//Sets
//Zad 1
print("Sets")
print("Zad 1")
var number = 10
var divisors = Set<Int>()
for i in 1...number {
    if (Int(number) % Int(i)) == 0 {
        divisors.insert(i)
    }
}
print(divisors.sorted())
print()


//Dictionaries
//zad 1

print("Dictionaries")
print("Zad 1")
var flights: [[String : String]] = [["flightNumber" : "AA8025", "destination":"Copenhagen"], ["flightNumber" : "BA1442", "destination":"New York"], ["flightNumber" : "BD6741", "destination":"Barcelona"]]
var flightNumbers = [String]()
for flight in flights {
    if let flightNumber = flight["flightNumber"] {
        flightNumbers.append(flightNumber)
    }
}
print(flightNumbers)

//zad 2
print("Zad 2")
var names = ["Hommer", "Lisa", "Bart"]
var fullName: [[String: String]] = []

for name in names {
    let fullNameDict = ["lastName": "Simpson", "firstName": name]
    fullName.append(fullNameDict)
}

print(fullName)

