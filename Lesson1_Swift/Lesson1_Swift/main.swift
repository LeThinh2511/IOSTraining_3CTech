//
//  main.swift
//  Lesson1_Swift
//
//  Created by ThinhLe on 7/25/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import Foundation

// let & var
let firstConst: Int = 6

var firstVar: Int = 5

firstVar = 7
print(firstVar)
print(firstConst)

//tuple
print("tuple")

var tuple: (num: Int, string: String, double: Double)
tuple = (1, "le thinh", 5.6)


print(tuple.num)
print(tuple)

//optional
print("optional")

var name: String? = "le thinh"
if let name = name
{
    print(name)
}

if name != nil
{
    print(name!)
}
name = nil
print(name ?? "thinh")

//structural condition: if, if let, guard let

print("if, if let, guard let")

func testGuard()
{
    let age: Int? = 21
    let job: String? = "student"
    
    guard let tuoi = age else
    {
        print("age is nil")
        return
    }
    guard let nghe = job else
    {
        print("job is nil")
        return
    }
    print("\(tuoi) - \(nghe)")
}

testGuard()

//structural loop
print("structural loop")

for i in 1...5
{
    print("\(i) ")
}

for i in 1..<5
{
    print("\(i) ")
}

var i = 2
while i < 5
{
    print("\(i) ")
    i += 1
}


// Array - Dictionary - Set

print("Array - Dictionary - Set")

var array: [Int] = [1, 3]
array[1] = 8

array = [1, 3]
print(array)
array.append(4)
array.remove(at: 0)
array[1] = 8
for i in array
{
    print("\(i)")
}

// Dictionary
var dictionary: [String : Int] = [:]


dictionary["one"] = 1
dictionary["two"] = 2
dictionary["three"] = 3


if let number = dictionary["two"]
{
    print(number)
}
for number in dictionary
{
    print("\(number.key) + \(number.value)")
}

// Set
var set: Set<String> = Set<String>()

set.insert("Thinh")
set.insert("Binh")
set.insert("Phong")
set.insert("Hien")

if set.contains("Thinh")
{
    print("Thinh is member")
}

print(set.count)

// Function type

func testFunction(name: String, age: Int) -> (String)
{
    return "My name is \(name), I'm \(age)"
}

func testPassFunctionAsAnAgument(function: (String, Int)->(String), string: String)
{
    print("\(string) \(function("Le Thinh", 21))")
}

testPassFunctionAsAnAgument(function: testFunction, string: "Hi there,")

// closure

func sort(array: inout [Int], condition: (Int, Int)->(Bool))
{
    for i in 0..<array.count - 1
    {
        for j in (i + 1)..<array.count
        {
            if !condition(array[i], array[j])
            {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
}

var arr = [1, 4, 6, 3, 17, 13, 2, 28, 7]
print("mang chua sap xep")
print(arr)

print("mang sap xep lon dan")
sort(array: &arr) { (a, b) -> (Bool) in
    return a < b
}
print(arr)

print("mang sap xep nho dan")
sort(array: &arr){ $0 > $1 }
print(arr)


// Enum
enum Color: String
{
    case red = "_red"
    case blue = "_blue"
    case yellow = "_yellow"
    case green = "_green"
    case white = "_white"
    case black = "_black"
}

enum Device
{
    case laptop(price: Int, weight: Int)
    case television(String)
    case mobile(String)
}

var device: Device = .laptop(price: 20, weight: 2)
var device1: Device = .television("abc")

print(device)

var color: Color = .yellow
print(color.rawValue)

switch color
{
case .red:
    print("red")
case .blue:
    print("blue")
case .yellow:
    print("yellow")
case .green:
    print("green")
default:
    print("black")
}

// class vs struct and inheritance
class Vehicle
{
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
    func showColor() {
        print(self.color)
    }
}


struct Animal {
    var numOfLeg: Int
    
    func showNumOfLeg()
    {
        print(self.numOfLeg)
    }
}

class Car: Vehicle
{
    var manufacture: String
    
    init(color: Color, manufacture: String) {
        self.manufacture = manufacture
        super.init(color: color)
    }
    
    func showCar()
    {
        print(self.manufacture)
    }
}

var car = Car(color: .red, manufacture: "Toyota")
car.showCar()
var car2 = car
car2.color = .black
print(car.color)
print(car.color == car2.color)
print(car === car2)

var animal: Animal = Animal(numOfLeg: 5)
print(animal.numOfLeg)

var animal2 = animal
animal2.numOfLeg = 7
print(animal.numOfLeg)
print(animal2.numOfLeg)

// Extension

extension Car
{
    func repaint(color: Color)
    {
        self.color = color
    }
}

car.repaint(color: .white)
car.showColor()

// protocol

@objc protocol Runnable {
    //var numOfLeg: Int? {get}
    @objc optional func run()
    func runFaster()
}

class Dog: Runnable
{
    var numOfLeg: Int?
    
    func run() {
        print("Dog is running")
    }
    
    func runFaster() {
        print("Dog is running fast")
    }
}

class Cat: Runnable
{
    fileprivate var numOfLeg: Int = 4
    
    
    func runFaster() {
        print("Cat is running fast")
    }
    
    func walk() {
        print("Cat is walking")
    }
}

extension Runnable where Self: Cat
{
    func walk()
    {
        print("some animal is walking")
    }
}

var cat: Cat = Cat()
cat.walk()
cat.numOfLeg = 5
print(cat.numOfLeg)

var firstName: String?

print(car.color)
var car4: Car? = Car(color: .yellow, manufacture: "thinh")
var car3: Car? = Car(color: .blue, manufacture: "le thinh")
//print(car3.color)

print("/////")
print(car4!.color)
print(car3!.color)

car3 = car4

print(car4!.color)
print(car3!.color)

car3?.color = .black
print(car4!.color)
print(car3!.color)










