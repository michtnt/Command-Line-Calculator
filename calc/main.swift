//
//  main.swift
//  calc
//
//  Created by Michelle Tanoto on 28/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

// setup ./calc arguments
var args = ProcessInfo.processInfo.arguments
args.removeFirst()

// for later use to print the final result
var result: Int

// validate arguments; if the arguments are all valid then calculate
if(Validator(input: args).validateInput()){
    // if there's only one character on args
    if(args.count == 1){
        // if the character is integer
        if(Int(args[0]) != nil){
        print(Int(args[0])!)
        }
        else{
            ExceptionHandler().invalidInput(error: "\(args[0])")
        }
    }
// if args > 2 (valid) continue to calculate from Calculator() class
    else if(args.count > 2){
        // calculate till the end if it stays valid and then return the final result
        result = Calculator(args: args).returnResult();
        print(result);
    }
}

