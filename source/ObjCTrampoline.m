//
//  ObjCTrampoline.m
//  SwiftCMake
//
//  Created by Eric Wing on 6/10/15.
//  Copyright (c) 2015 PlayControl Software LLC. All rights reserved.
//

#import "MySwiftInterfaceHeader.h"
#include <stdio.h>
int ObjCTrampoline_EnterMain(int argc, char* argv[])
{
	for(int i=0; i<argc; i++)
	{
		fprintf(stderr, "arg[%d]: %s\n", i, argv[i]);
	}
	
	int retval = [MySwiftEntryClass enterMain:argc argv:argv];
	
	return retval;
}
