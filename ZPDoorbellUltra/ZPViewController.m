//
//  ZPViewController.m
//  ZPDoorbell
//
//  Created by Doug Feigelson on 8/23/12.
//  Copyright (c) 2012 Doug Feigelson. All rights reserved.
//

#import "ZPViewController.h"
#import "credentials.m"

static int WEBVIEW_RELOAD_DELAY = 1*60;

@interface ZPViewController ()

@end

@implementation ZPViewController
@synthesize ourWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    ourWebView.userInteractionEnabled = NO;
    [self reloadWebViewAndLoop];
}

-(void)reloadWebViewAndLoop {
    [ourWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:INFO_URL]]];
    [self performSelector:@selector(reloadWebViewAndLoop) withObject:nil afterDelay:WEBVIEW_RELOAD_DELAY];
}

- (void)viewDidUnload
{
    [self setOurWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)doorbellTouched:(id)sender {
    [self hitURL:DOORBELL_URL];
}

- (IBAction)deliverytouched:(id)sender {
    [self hitURL:DELIVERY_URL];
}

- (IBAction)arbtext:(id)sender {
    NSString* s = [ARBITRARY_TEXT_URL stringByAppendingString:@""];
    
    NSLog(@"%@",s);
    [self hitURL:s];
}

-(void)hitURL:(NSString*)url {
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    
    [request setHTTPMethod: @"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *r, NSData *d, NSError *e) {
            // idk what the server response with
        NSLog(@"%@",[[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding]);
    }];

}

@end
