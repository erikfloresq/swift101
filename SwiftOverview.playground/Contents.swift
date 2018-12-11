import Foundation

// Utils

func 🖨(_ character: Character,_ number: Int = 50) {
    var collectionString = ""
    for _ in 0..<number {
        collectionString += String(character)
    }
    print(collectionString)
}


// WELCOME TO SWIFT

let name: String = "Erik"
let surname = "Flores"
let me = "👨🏻‍💻"
let twitter = "@erikfloresq"
let email = "erikfloresq@gmail.com"
let age = String(29) + " años"
let nickname: String? = "Werik"
let myAmazingHobbies = ["read", "lettering", "eat a lot"]

func showHobbies(using hobbies: [String]) -> String {
    let emojis = hobbies.map { hobbie -> String in
        switch hobbie {
        case "read":
            return "📕"
        case "lettering":
            return "🖋"
        case let x where x.hasPrefix("eat"):
            return "🍜"
        default:
            return ""
        }
    }
    var myHobbies = ""
    emojis.forEach { (emoji) in
        myHobbies += "\(emoji) "
    }
    return myHobbies
}

let bio = """
    Hi!
    My name:     \(name) \(surname) \(me)
    My twitter:  \(twitter)
    My email:    \(email)
    My age:      \(age)
    My nickname: \(nickname ?? "Erik")
    My hobbies:  \(showHobbies(using: myAmazingHobbies))
"""
print(bio)

🖨("_")

// OPTIONALS

if let myNickname = nickname {
    print("Hi \(myNickname)")
}

🖨("_",20)

guard let myNickname = nickname else {
    fatalError("No nickname")
}
print(myNickname)

🖨("_",20)

// CONTROL FLOW

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

🖨("_",20)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

🖨("_",20)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

🖨("_",20)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

🖨("_",20)

// FUNCTIONS AND CLOSURES

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)

print(statistics.2)

🖨("_",20)

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

🖨("_",20)

// OBJECT AND CLASESS

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)

triangle.perimeter = 9.9
print(triangle.sideLength)

🖨("_",20)

// ENUMS

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

print(heartsDescription)

🖨("_",20)

// STRUCT

struct Card {
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

🖨("_",20)

// PROTOCOLS AND EXTENSIONS

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

print(aDescription)

🖨("_",20)

// ERROR HANDLING

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//!! Optionals
// let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")

//!! Forcing
// let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")

// DEFER

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

// GENERICS

// Make array with Int

func makeArrayInt(repeating item: Int, numberOfTimes: Int) -> [Int] {
    var result = [Int]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArrayInt(repeating: 3, numberOfTimes: 4)

// Make array with Int

func makeArrayString(repeating item: String, numberOfTimes: Int) -> [String] {
    var result = [String]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArrayString(repeating: "hola", numberOfTimes: 4)

// Generics !

func makeArray<T>(repeating item: T, numberOfTimes: Int) -> [T] {
    var result = [T]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
print(makeArray(repeating: "knock", numberOfTimes: 4))


🖨("_",20)














