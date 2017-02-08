//
//  WebViewViewController.m
//  iOS_HTML5
//
//  Created by zivInfo on 17/1/12.
//  Copyright © 2017年 xiwangtech.com. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"iOS与HTML5交互";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
    [self loadWebURL];
    
}

-(void) initView
{
    self.webView.scalesPageToFit = YES;
    self.webView.backgroundColor = [UIColor clearColor];
}

-(void) loadWebURL
{
    NSURL *webURL = [[NSURL alloc] initWithString:@"https://www.baidu.com"];
    NSURLRequest *webRequest = [[NSURLRequest alloc] initWithURL:webURL];
    
    [self.webView loadRequest:webRequest];
}

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//{
//    
//}

- (void)webViewDidStartLoad:(UIWebView *)webView
{

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"URL %@", currentURL);
    
    NSString *headerStr = @"document.getElementsByTagName('h1')[0].innerText = '测试文字';";
    [webView stringByEvaluatingJavaScriptFromString:headerStr];

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
