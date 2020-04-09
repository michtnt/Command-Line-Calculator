//
//  main.swift
//  calc
//
//  Created by Michelle Tanoto on 28/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

// get calculator program arguments
var args = ProcessInfo.processInfo.arguments
// remove ./calc
args.removeFirst()

// variable to store the calculation result
var result: Int

// validate arguments; if returns true means arguments valid then calculate
if(Validator(input: args).validateInput()){
    // if there's only one character on args
    if(args.count == 1){ // if it's a number
        if(Int(args[0]) != nil){
             print(Int(args[0])!)
        } else{ // if it's not a number
            ExceptionHandler().invalidInput(error: "\(args[0])")
        }
     }
// if args > 2 continue to calculate from Calculator() class
    else if(args.count > 2){
        // calculate until the end of the arguments and then return the final result
        result = Calculator(args: args).returnResult();
        print(result);
    }
}

