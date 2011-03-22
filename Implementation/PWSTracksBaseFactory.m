//
//  PWSTracksBaseFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksBaseFactory.h"


@implementation PWSTracksBaseFactory

@synthesize parser, connection, receivedData;

static NSString * serverAddress = @"http://my.gtdify.com";

+(void)setServerAddress:(NSString *)newServerAddress {
	
	[serverAddress release];
	serverAddress = [newServerAddress retain];
}

+(NSString *)serverAddress {
	
	return serverAddress;
}

#pragma mark -
#pragma mark Internal implementation
#pragma mark - Instance

-(id<PWSTracksService>)initWithDelegate:(id<PWSTracksServiceDelegate>)newDelegate {
    
    /*if (self = [super init]){
        self.delegate = newDelegate;
        self.cancelling = NO;
        self.failSent = NO;
    }*/
    return self;
}

-(void)handleErrorWithCode:(PWSTracksError)code {
    
    /*if (!self.cancelling && !self.failSent) {
        
        self.failSent = YES;
        
        [self.delegate gitHubService:self
                    didFailWithError:[NSError
                                      errorWithDomain:GitHubServerErrorDomain
                                      code:code
                                      userInfo:nil]];
        
        [self cleanUp];
    }*/
}

- (void)makeRequest:(NSString *) url {
    NSLog(@"Begin: makeRequest url=%@", url);
    
	//self.request = url;
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	self.connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if (self.connection) {
        
        self.receivedData = [NSMutableData data];
    }
    
    NSLog(@"End: makeRequest");
}

#pragma mark -
#pragma mark Delegate protocol implementation
#pragma mark - NSXMLParserDelegate

-(void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
 namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName
   attributes:(NSDictionary *)attributeDict {
    NSLog(@"Begin: didStartElement %@", elementName);
    
    /*SEL aSel = [[self.startElement objectForKey:elementName] pointerValue];
    
    if (aSel) {
        
        [self performSelector:aSel withObject:elementName withObject:attributeDict];
    }
    self.currentStringValue = [NSMutableString stringWithCapacity:100];*/
}

-(void)parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
 namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName {
    NSLog(@"Begin: didEndElement %@", elementName);
    /*SEL aSel = [[self.endElement objectForKey:elementName] pointerValue];
    
    if (aSel) {
        
        [self performSelector:aSel withObject:elementName];
    }
    self.currentStringValue = nil;*/
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    //[self.currentStringValue appendString:string];
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    //[self handleErrorWithCode:GitHubServerParserError];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    
   /* if (!self.failSent && !self.cancelling) {
        
        [self.delegate gitHubServiceDone:self];
        [self cleanUp];
    }*/
}


#pragma mark -
#pragma mark NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Begin: didReceiveResponse");
    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"Begin: didReceiveData");
    [self.receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error {
    // handle error
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Begin: connectionDidFinishLoading");
    
    self.parser = [[[NSXMLParser alloc]
                    initWithData:self.receivedData] autorelease];
    
    [self.parser setDelegate:self];
    [self.parser parse];
    self.connection = nil;
    self.receivedData = nil;
    
    NSLog(@"End: connectionDidFinishLoading");
}

@end
