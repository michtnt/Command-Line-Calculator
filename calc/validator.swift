//
//  validator.swift
//  calc
//
//  Created by Michelle Tanoto on 27/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

// Validate the input of the calculator program
struct Validator{
    
    let input: [String]
    let i = 0

// check if it's valid return true if they are valid, false if not
func validateInput() ->  Bool {
    
    // if there's only one argument and it's not int
    if(args.count == 1 && Int(args[0]) == nil){
         ExceptionHandler().invalidInput(error: "\(args[0])")
    }
    
    // if there's no arguments inside
    if (input.isEmpty){
        ExceptionHandler().emptyInput();
        return false;
    }
    
    // if argument count is invalid e.g: 3 digits
    if (input.count % 2 == 0) {
        ExceptionHandler().incompleteInput()
        return false;
    }
    
    //if on a certain position it's not a number then return false
    // examine whether it's integer every +2 position
    for i in stride(from: 0, to: input.count-2, by: 2) {
            if (Int(input[i]) == nil) { // if can't be converted to Int means it's not Int
                ExceptionHandler().invalidInput(error: input[i])
                return false;
            }
        }
    
    //if on a certain position it's not an operator then return false
    //examine whether it's operator every +2 position
    for i in stride(from: 1, to: input.count-1, by: 2) {
        if (!["x","+","-","/","%"].contains(input[i])) { // if can't be converted to Int means it's not Int
                ExceptionHandler().invalidOperator(error: input[i])
                return false;
            }
        }
    // if no error found
    return true;
    }
}
