import SwiftUI

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

print(luckyNumbers.sorted().filter{!$0.isMultiple(of: 2)}.map{"\($0) is a lucky number \n"}.joined())

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

