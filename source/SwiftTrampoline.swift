

@objc class MySwiftEntryClass
{
	class func enterMain(argc:Int, argv:UnsafeMutablePointer<UnsafeMutablePointer<CChar>>) -> Int32
	{
		println("argc: \(argc)")
		
		var string_array : [String] = [String]()
		for(var i=0; i<argc; i++)
		{
			var current_arg : String = String.fromCString(argv[i])!
			println("arg[\(i)]: \(current_arg)");
			string_array.append(current_arg)
		}
		
		
		return main(argc, string_array)
		
	}
}

