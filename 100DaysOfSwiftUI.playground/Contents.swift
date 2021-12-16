// Introduction to Swift

// Day 1

// Day 9
// closures, passing functions into functions, and checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

print(luckyNumbers.sorted().filter{!$0.isMultiple(of: 2)}.map{"\($0) is a lucky number \n"}.joined())

// Day 11
// access control, static properties and methods, and checkpoint 6

struct Car {
    let model: String
    let seats: Int
    private(set) var gear = 1
    
    mutating func changeGear(difference: Int) {
        let newGear = gear + difference
        
        if newGear >= 1 && newGear <= 10 {
            gear = newGear
        }
    }
}

var car = Car(model: "Alfa Romeo 147", seats: 5)
car.changeGear(difference: 1)
print(car.gear)

// Day 12
// classes, inheritance, and checkpoint 7

class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Vau, vau!")
    }
}

class Cat: Animal {
    let isTame: Bool
    func speak() {
        print("Ņau, Ņau")
    }
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

class Corgi: Dog {
    override func speak() {
        print("Vau, vau, vau!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Vau, vau, vau, vau, vau!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Mņau, Mņau")
    }
}

class Lion: Cat {
    override func speak() {
        print("Raur, Raur!")
    }
}

// Day 13
// Protocols, extensions and checkpoint 8

// Sample extension

extension Int {
    func cubed() -> Int {
        return self * self * self
    }
}

// Protocol extensions

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8

protocol Building {
    var type: String { get }
    var rooms: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    func printSummary()
}

extension Building {
    func printSummary() {
        print("Talk to \(agent) to buy this \(type) for $\(cost)")
    }
}

struct House: Building {
    let type = "house"
    var rooms: Int
    var cost: Int
    var agent: String
}

struct Office: Building {
    let type = "office"
    var rooms: Int
    var cost: Int
    var agent: String
}

let exampleHouse = House(rooms: 4, cost: 500_000, agent: "Swift & Co")
exampleHouse.printSummary()

let exampleOffice = Office(rooms: 30, cost: 12000000, agent: "Taytay inc")
exampleOffice.printSummary()

// Day 14
// Optionals, nil coalescing, and checkpoint 9

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

// unwrap

if let number = number {
    print(square(number: number))
}

// Guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// Use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.

// nil coalescing

let captains = ["Enterprise" : "Picard"]
let new = captains["Serenity"] ?? "N/A"

// optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// Checkpoint 9

func getNumber(in array: [Int?]?) -> Int {
    lazy var random = Int.random(in: 1...100) // only generated if used
    return (array?.randomElement() ?? random) ?? random
}
