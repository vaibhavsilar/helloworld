//
//  WebViewController.m
//  WebViewDemo
//
//  Created by Dinesh Kaushik on 01/09/14.
//  Copyright (c) 2014 Dinesh Kaushik. All rights reserved.
//

#import "WebViewController.h"
#import "AppDelegate.h"
@interface WebViewController ()

@property (nonatomic , strong) IBOutlet UIWebView *webView;
@property (nonatomic , strong) AppDelegate* appDel;

@end

@implementation WebViewController

@synthesize webView;
@synthesize appDel;
__weak id weakself;
__weak id arr1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    weakself = self;
    weakself = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (weakself) {
        // Custom initialization
    }
    return weakself;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(50, 50, 100, 50);
    [btn setTitle:@"Unload!" forState:UIControlStateNormal];
    [self.view addSubview:btn];
   //  NSLog(@"web view created");
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    appDel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDel.arr addObject:self];
   // NSLog(@"count %d",[appDel.arr count]);
    
}
-(void) buttonClicked:(UIButton*)sender
{
    NSLog(@"removing view");
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [webView removeFromSuperview];
    webView.delegate = nil;
    [webView stopLoading];
    [webView loadHTMLString:@"" baseURL:nil];
    
}

- (void)dealloc {
    NSLog(@"dealloc destroyed");
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [webView removeFromSuperview];
    webView.delegate = nil;
    [webView stopLoading];
    [webView loadHTMLString:@"" baseURL:nil];
    self.webView = nil;
}
-(void)viewDidAppear:(BOOL)animated {
    
    // set URl here
    
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"index"
                                             withExtension: @"html"];
    
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:htmlURL];
   [webView loadRequest:requestObj];

}
-(void)viewDidDisappear:(BOOL)animated {
     NSLog(@"----- viewDidDisappear");
    [appDel.arr removeObject:self];
}

- (void)didReceiveMemoryWarning
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
                                                    message:@"Memory Warning" delegate:self cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
