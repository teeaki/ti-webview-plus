//
//  JpKing3WebviewPlusWebViewPlus.m
//  ti-webview-plus
//
//  Created by takaaki suzuki on 2012/08/18.
//
//

#import "JpKing3WebviewPlusWebViewPlus.h"
#import "JpKing3WebviewPlusWebViewPlusProxy.h"

@implementation JpKing3WebviewPlusWebViewPlus

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	if([super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType]) {
        NSArray *handles = [self.proxy valueForUndefinedKey:@"schemaHandles"];
        if(!handles || handles.count == 0) {
            return YES;
        }
        NSString *url = [[request URL] absoluteString];
        for(NSString *schema in handles) {
            if([url hasPrefix:[TiUtils stringValue:schema]]) {
                NSDictionary *args = [NSDictionary dictionaryWithObject:url forKey:@"url"];
                [self.proxy fireEvent:[TiUtils stringValue:schema] withObject:args];
                return NO;
            }
        }
        return YES;
    } else {
        return NO;
    }
}

@end
