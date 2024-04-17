import UIKit
//Functions
func minValue (_ a: Int, _ b: Int) -> Int {
    if (a > b) {
        return b
    }
    return a
}

func lastDigit (_ num: Int) -> Int {
    return num%10
}

func divides (_ a: Int, _ b: Int) -> Bool{
    if (a%b == 0) {
        return true
    }
    return false
}

func countDivisors(_ a: Int) -> Int {
    var divisors = 0
    for i in 1...a {
        if (divides(a, i)) {
            divisors += 1
        }
    }
    return divisors
}

func isPrime(_ a: Int) -> Bool {
    let divisors = countDivisors(a)
    if (divisors == 2) {
        return true
    }
    return false
}

print("Functions")
print(minValue(10, 5))
print(lastDigit(123456))
print(isPrime(12))
print(isPrime(13))
print()


print("Closures")
func smartBart(_ n: Int, closure: () -> Void) {
    for _ in 1...n {
        closure()
    }
}

smartBart(5) {
    print("I will pass this course with the best mark, because Swift is great!")
}

let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
var divFour = numbers.filter{($0 % 4) == 0}
print(divFour)

let max = numbers.reduce(Int.min, { Swift.max($0, $1) })
print(max)

var strings = ["Gdansk", "University", "of", "Technology"]
let text = strings.reduce(""){$0 + " " + $1}
print(text)

let numbers2 = [1, 2 ,3 ,4, 5, 6]
let odd = numbers2.filter{($0%2) == 1}
let oddSquared = odd.map{$0*$0}
print(oddSquared.reduce(0){$0 + $1})
print()


print("Tuples")
func minMax (_ a: Int, _ b: Int) -> (Int, Int) {
    let minVal = Swift.min(a, b)
    let maxVal = Swift.max(a, b)
    let temp = (minVal, maxVal)
    return temp
}

let temp = minMax(10, 5)

print("Min Value: ", temp.0)
print("Max Value: ", temp.1)

var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of", "technology", "technology", "gdansk", "gdansk"]

var countedStringsDict = [String: Int]()
for string in stringsArray {
    countedStringsDict[string, default: 0] += 1
}
let countedStrings = countedStringsDict.map { ($0.0, $0.1) }
print(countedStrings)
print()

print("Enum")

enum Day: Int {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    
    func dailyEmoji() -> String {
        switch self {
        case .monday:
            return "🌙"
        case .tuesday:
            return "🂡"
        case .wednesday:
            return "🏟️"
        case .thursday:
            return "🌪️"
        case .friday:
            return "🥂"
        case .saturday:
            return "🪐"
        case .sunday:
            return "☀️"
        }
    }
}

let today = Day.wednesday
print("Today is ", today.dailyEmoji())

