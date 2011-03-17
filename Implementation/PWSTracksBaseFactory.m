//
//  PWSTracksBaseFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksBaseFactory.h"


@implementation PWSTracksBaseFactory

static NSString * serverAddress = @"http://my.gtdify.com";

+(void)setServerAddress:(NSString *)newServerAddress {
	
	[serverAddress release];
	serverAddress = [newServerAddress retain];
}

+(NSString *)serverAddress {
	
	return serverAddress;
}

- (void)makeRequest:(NSString *) url {
	//self.request = url;
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	//self.parser = [[[YAJLParser alloc] init] autorelease];
	//self.parser.delegate = self;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	//[self.parser parse:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {	
	[connection release];
}

@end
