//
//  SwiftMain.swift
//  SwiftCMake
//
//  Created by Eric Wing on 6/10/15.
//  Copyright (c) 2015 PlayControl Software LLC. All rights reserved.
//


// This function is where I consider my Swift prgogram starts. 
func main(argc: Int, argv: [String]) -> Int32
{
	for(var i=0; i<argc; i++)
	{
		var current_arg : String = argv[i]
		println("arg[\(i)]: \(current_arg)");
	}
	
	// Call a C function from Swift
	let ret_val : CInt = MyCFunctions_DoSomething()
	println("quiting with \(ret_val)")
	return ret_val;
}

