//
//  exceptionHandler.swift
//  calc
//
//  Created by Michelle Tanoto on 27/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

// to handle all the errors and display the right message according to the error type
struct ExceptionHandler {
// error types
    enum CalculatorError: Error {
        case emptyInput
        case divisionByZero
        case invalidNumber
        case invalidOperator
        case incompleteInput
        case invalidInput
    }

// error handling

// user does not give any input parameters e.g: ./calc
func emptyInput() {
    do {
        throw CalculatorError.emptyInput
    } catch {
        print("Error: missing input. Input shoold be in the form of [number] [operator number...]")
         exit(1)
    }
}

// user divide a number with 0 e.g: ./calc 5 / 0
func divisionByZero() {
     do {
         throw CalculatorError.divisionByZero
     } catch {
        print("Error: Division by zero.")
          exit(2)
     }
 }

// user insert something that's not an int e.g: ./calc 5 + +
func invalidNumber(error : String) {
     do {
         throw CalculatorError.invalidNumber
     } catch {
         print("Error: Invalid number: \(error)")
         exit(3)
     }
 }

// user insert other operators besides +,-,/,x,% e.g: ./ calc 5 & 2
func invalidOperator(error : String) {
     do {
         throw CalculatorError.invalidOperator
     } catch {
         print("Error: Unknown operator: \(error)")
         exit(4)
     }
 }

// users insert parameters that results in even argument count e.g: ./ calc 1 + 2 +
func incompleteInput() {
     do {
         throw CalculatorError.incompleteInput
     } catch {
         print("Error: incomplete Input. Input should be in the form of [number] [operator number ...]")
         exit(5)
     }
 }
    
// user enter invalid input that can't be calculated e.g: wrong position of operators 2 + + 5
func invalidInput(error: String){
     do {
        throw CalculatorError.invalidInput
     } catch {
         print("Error: Invalid Input \(error)")
         exit(6)
     }
 }

}


