//
//  IVVKLoginViewController.m
//  NSURLSessionTest
//
//  Created by Игорь Веденеев on 28.09.15.
//  Copyright © 2015 Игорь Веденеев. All rights reserved.
//

#import "IVVKLoginViewController.h"
#import "IVAccessToken.h"

static NSString* const kAuthURLString = @"https://oauth.vk.com/authorize?client_id=5086258&display=mobile&redirect_uri=http://oauth.vk.com/blank.html&scope=4098&response_type=token&v=5.37";

@interface IVVKLoginViewController () <UIWebViewDelegate>

@property (copy, nonatomic) IVLoginCompletionBlock completionBlock;
@property (weak, nonatomic) UIWebView* loadView;

@end

@implementation IVVKLoginViewController

- (id) initWithCompletionBlock:(IVLoginCompletionBlock) completionBlock {
    
    self = [super init];
    if (self) {
        self.completionBlock = completionBlock;
    }
    return self;
}

- (void)viewDidLoad {
    
    if (self) {
        [super viewDidLoad];
        
        //NSLog(@"IN VIEWDIDLOAD %@", self.description);
        NSLog(@"IN VIEWDIDLOAD %@", [self description]);
        CGRect frame = self.view.bounds;
        frame.origin = CGPointZero;
        
        UIWebView* loginView = [[UIWebView alloc] initWithFrame:frame];
        loginView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:loginView];
        self.loadView = loginView;
        
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                      target:self
                                                                                      action:@selector(actionCancel:)];
        [self.navigationItem setRightBarButtonItem:cancelButton animated:YES];
        self.navigationItem.title = @"Login";
        
        NSURL* authURL = [NSURL URLWithString:kAuthURLString];
        NSURLRequest* authRequest = [NSURLRequest requestWithURL:authURL];
        [loginView loadRequest:authRequest];
        
        //+4096- messages  +2-firnds

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    NSLog(@"RELEASED");
    self.loadView.delegate = nil;
}

#pragma mark - UIWebViewDelegate

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

#pragma mark - Actions

- (void) actionCancel:(UIBarButtonItem*) button {
    
    if (self.completionBlock) {
        self.completionBlock(nil);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    NSLog(@"LOGIN VIEW WILL APPEAR");
    
}

- (NSString*) description {
    
    return @"huy";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
