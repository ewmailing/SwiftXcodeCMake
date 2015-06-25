# SwiftCMake test example
This is a very simple test example of a program that intermixes C, Objective-C, and Swift.
This is meant to a minimal, yet comprehensive representation of what most projects will have to deal with.
Specifically, we have C calling into Swift, and Swift calling into C. 
Because there is no direct way to go from the C to Swift direction, we must cross-through Objective-C.
Hence, this minimal example is comprehensive.


Most cross-platform projects will have some core C code. 
At some point for Apple platforms, this code will need to call out to either Objective-C or Swift to access native features.

In this example, we start with main.c and int main().
From there, we ultimately want to call Swift and run some code in Swift, and make a call to C.


In main.c in main(), we start to leave the C world by calling the function ObjCTrampoline_EnterMain().
This is a C function, but it has an Objective-C implementation. It is not possible to directly call into Swift from C.
But since Objective-C is a pure superset of C, we can create a pure C function which is implemented with Objective-C and Objetive-C can call Swift.

So next, we are in ObjCTrampoline.m containing the implementation of the ObjCTrampoline_EnterMain() function.
Objective-C and Swift can call each other pretty easily. We created a Swift class called MySwiftEntryClass in SwiftTrampoline.swift.
We define a class method called enterMain:argv: which we can easily invoke from Objective-C.


Note: For those not too familiar with Objective-C, it is worth pointing out that we are sticking to pure Objective-C language features and not using libraries/frameworks. 
My Objective-C and Swift classes do not inherit from NSObject or anything in the Foundation.framework.
This maximizes the potential that we can use this code on non-Apple platforms that don't provide Foundation.


Next, we're in SwiftTrampoline.swift inside the class implementation. We are now in Swift and can do anything we want.
Kind of for symmetry with C, I created a function in Swift called "main". I define this function in another file called SwiftMain.swift.
This extra jump is not required, nor is it necessarily an advocated Swift pattern.
I just personally wanted to isolate the trampoline code from the user's actual Swift code.

So in SwiftMain.swift, we have our main function and we can do Swift things.
But now, let's complete the circle, and let's call a C function from Swift.
I've defined my own C function called MyCFunctions_DoSomething() in MyCFunctions.h/.c.
To be able to call this C function, we must have any C functions defined in the Swift "Bridging Header".
I defined my Bridging Header to be "MySwiftBridgingHeader.h" in the Xcode settings.
In that header, I #include "MyCFunctions.h". Alternatively, I could copy the prototype definition directly into the header instead of including a header.

With that set up, I can call the C function in Swift.
Afterwards, my function returns, and we go back to where we came from. Each function returns, so we eventually end up back in main.c and our program ends.



