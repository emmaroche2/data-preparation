//
//  CBViewController.m
//  Navegador iPad
//
//  Created by Carlos on 07/05/14.
//  Copyright (c) 2014 Carlos Butron. All rights reserved.
//

#import "CBViewController.h"
#import "CBBookmarks.h"
#import "CBTPopover.h"
#import "CBModalViewController.h"

@interface CBViewController () <UITextFieldDelegate, UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aivLoading;
@property (weak, nonatomic) IBOutlet UIWebView *wbvBrowser;
@property (weak, nonatomic) IBOutlet UITextField *txtUrl;

@property (strong, nonatomic) NSMutableArray *history;

- (void)loadURL;

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtUrl.delegate = self;
    self.wbvBrowser.delegate = self;
    
    self.txtUrl.text = @"http://carlosbutron.es";
    [self loadURL];
    
    self.history = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadURL
{
    [self.wbvBrowser loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.txtUrl.text]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.aivLoading startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString * titulo = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSString * URL = [webView.request.URL absoluteString];
    
    [self.navigationController.navigationBar.items setValue:titulo forKey:@"prompt"];
    
    self.txtUrl.text = URL;
    
    CBBookmarks * m =[[CBBookmarks alloc] initWithTitle:titulo URL:URL];
    
    [self.history insertObject:m atIndex:0];
    
    [self.aivLoading stopAnimating];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self loadURL];
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"popover"]) {
        CBTPopover * table = [segue destinationViewController];
        //table.delegate = self;
        table.history = self.history;
        table.popover = [(UIStoryboardPopoverSegue *) segue popoverController];
    }
    
    if ([segue.identifier isEqualToString:@"modal"]) {
        CBModalViewController * modal = [segue destinationViewController];
        modal.code = [self.wbvBrowser stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    }
}

- (void)selectedURL:(NSString *)url PopoverController:(UIPopoverController *)popover
{
    self.txtUrl.text = url;
    [self loadURL];
    [popover dismissPopoverAnimated:YES];
}

@end
