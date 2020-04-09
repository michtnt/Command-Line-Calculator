//
//  calculator.swift
//  calc
//
//  Created by Michelle Tanoto on 27/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//


import Foundation

// calculate 2 integers from arguments
class Calculator {
    
    var num1: Int = 0
    var num2: Int = 0
    var operation: String
    var flag: Int = 0 // position of two pairs of integer
    
    init(args: [String]) {
        // initial values to array position
        // for the first number in arguments
        if Int(args[flag]) != nil {
            num1 = Int(args[flag])!;
        }
        // for the second number in arguments
        if Int(args[flag+2]) != nil {
            num2 = Int(args[flag+2])!;
        }
        // operation always have to be in odd position
        operation = args[flag+1];
        
        // if it's not a priority keep pairing two integers
        if !isPriorityOperation() {
            pairInt(args: args);
        }
    }
    
    // operations based on priority
    func isPriorityOperation() -> Bool {
         switch operation {
         case "+":
             return false
         case "-":
             return false
         case "x":
             return true
         case "/":
            return true
         case "%":
             return true
         default:
             return false
         }
     }
    
    // checking all arguments when it's not the end and priority keep going
    func priorityQueue(args: [String]){
        // while hasn't reach the end of argument and it's not priority
        if (flag < args.count-3 && !isPriorityOperation()) {
            flag+=2;
            num1 = Int(args[flag])!;
            num2 = Int(args[flag+2])!;
            operation = args[flag+1];
            priorityQueue(args: args);
        }
    }
    
    // find pairs according to priority
    func pairInt(args: [String]) {
        priorityQueue(args: args);
        // if nothing's found, calculate the only arguments
         if (flag == args.count-3 && !isPriorityOperation()) {
            flag = 0;
            num1 = Int(args[0])!;
            operation = args[1];
            num2 = Int(args[2])!;
         }
    }
    
      func add(a: Int, b: Int) -> Int {
        return a + b;
      }
      
      func substract(a: Int, b: Int) -> Int {
        return a - b;
      }
      
      func multiply(a: Int, b: Int) -> Int {
        return a * b;
      }
      
     func divide(a: Int, b: Int)  -> Int {
        return a / b;
      }
      
     func modulo(a: Int, b: Int)  -> Int{
        return a % b;
      }
    
    // performs calculation from the founded pair
    func calculate() -> (res: Int?, pos: Int) {
        var result: Int = 0

        // if it's divided or modulo with 0 throws divisionByZero error
        if (operation == "/" || operation == "%") {
            if(num2 == 0){
                ExceptionHandler().divisionByZero()
            }
        }

        switch operation {
            case "+":
                result = add(a: num1, b: num2)
            case "-":
                result = substract(a: num1, b: num2)
            case "x":
                result = multiply(a: num1, b: num2)
            case "/":
                result = divide(a: num1, b: num2)
            case "%":
                result = modulo(a: num1, b: num2)
            default:
                // in case the operator is invalid
                ExceptionHandler().invalidOperator(error: "\(operation)")
            }
        // return the result of the two integer pair and the pair's position
        return (result, flag);
    }
    
    // process the arguments to keep calculating until there's only one final result left in the arguments
    func returnResult() -> Int {
        var temp: [String] = args // to not override the real arguments
        var value: (result: Int?, position: Int) = (0, 0)

        // while arguments array still have numbers to calculate keep going
        while(temp.count > 2){
            (value.result, value.position) = Calculator(args: temp).calculate();

            // if result on the left side of array
            if value.position == 0 && temp.count > 1 && temp.count > 3 {
                temp = ["\(value.result!)"]  + Array(temp[value.position + 3...temp.count - 1])
            }
            // if result on the middle of array
            else if value.position > 0 && value.position < temp.count-3  {
                temp = Array(temp[0...value.position - 1]) + ["\(value.result!)"] +    Array(temp[value.position + 3...temp.count - 1])
            }
            // if it is the only result then return the final result
            else if value.position == 0 && temp.count == 3 {
                temp = ["\(value.result!)"]
            }
            // if the result is on the right side of array
             else {
                temp = Array(temp[0...value.position-1]) + ["\(value.result!)"]
            }
        }
        // return the final result (in the end arguments array will only have one final result.)
        return value.result!
    }
    
}

