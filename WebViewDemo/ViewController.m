//
//  ViewController.m
//  WebViewDemo
//
//  Created by Dinesh Kaushik on 01/09/14.
//  Copyright (c) 2014 Dinesh Kaushik. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()

@property (nonatomic , strong) IBOutlet UIButton *btnOpenWebView;
@property (nonatomic , strong) IBOutlet WebViewController *webViewController1 ;
-(void)openWebViewClicked;

@end

@implementation ViewController

@synthesize btnOpenWebView;
__weak id weakself;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    weakself = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (weakself) {
        // Custom initialization
    }
    return weakself;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [btnOpenWebView addTarget:weakself action:@selector(openWebViewClicked) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
    
}
-(void)openWebViewClicked {
    
    WebViewController *webViewController = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
                                                    message:@"Memory Warning" delegate:weakself cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    // Dispose of any resources that can be recreated.
}

@end
