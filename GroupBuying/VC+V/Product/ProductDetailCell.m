//
//  ProductDetailCell.m
//  GroupBuying
//
//  Created by TuTu on 16/12/2.
//  Copyright © 2016年 teason. All rights reserved.
//

#import "ProductDetailCell.h"

@interface ProductDetailCell ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ProductDetailCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _webView.scrollView.scrollEnabled = false ;
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://weibo.com"]] ;
    [_webView loadRequest:request] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
