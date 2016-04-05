//
//  main.swift
//  SimpleCalc
//
//  Created by Xiaowen Feng on 3/31/16.
//  Copyright © 2016 Xiaowen Feng. All rights reserved.
//

import Foundation

var nums = [String]()

func main() {
    print("Enter an expression separated by returns:")
    calculate(input())
    print()
    print("Would you like to do another calculation? [Y/N]")
    if (input() == "Y") {
        nums = [String]()
        main()
    }
}

// get input from user
func input() -> String {
    return readLine(stripNewline: true)!
}

// convert input into integer
func convert(incoming: String) -> Double {
    return Double.init(incoming)!
}

func calculate(str: String){
    if (!nums.isEmpty) {
        switch str {
        case "+":
            print("Result: \(convert(nums.removeLast()) + convert(input()))")
        case "-":
            print("Result: \(convert(nums.removeLast()) - convert(input()))")
        case "*":
            print("Result: \(convert(nums.removeLast()) * convert(input()))")
        case "/":
            print("Result: \(convert(nums.removeLast()) / convert(input()))")
        case "%":
            print("Result: \(convert(nums.removeLast()) % convert(input()))")
            
        case "count":
            print("Result: \(nums.count)")
            
        case "avg", "average":
            print("Result: \(avg())")
            
        case "fact" :
            if (nums.count == 1) { // only takes one number
                let last = convert(nums.removeLast())
                if (last % 1 == 0.0) { // if the number is integer
                    
                    print("Result: \(fact(Int(last)))")
                } else {
                    print("Only integer has factorial")
                }
            } else {
                print("Please enter only one integer")
            }
            
        default: // when str is a number
            nums.append(str)
            calculate(input())
        }
        
    } else {
        nums.append(str)
        calculate(input())
    }
}

// calculates the average for numbers
func avg() -> Double {
    var sum = 0.0
    for n in nums {
        sum +=  Double(convert(n))
    }
    return sum / Double(nums.count)
}

// calcutes the factorial for a number
func fact(n: Int) -> Int {
    var value = n
    var fact = 1
    while (value != 0) {
        fact *= value
        value -= 1
    }
    return fact
}
main()





