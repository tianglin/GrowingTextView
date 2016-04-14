//
//  UIPlaceHolderTextView.m
//  LoveLive
//
//  Created by chaoye on 15/10/22.
//  Copyright © 2015年 chaoye. All rights reserved.
//

#import "UIPlaceHolderTextView.h"

@interface UIPlaceHolderTextView ()

@property (nonatomic, strong) UITextView *placeHolderTextView;

@end

@implementation UIPlaceHolderTextView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self loadPlaceHolderView];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self loadPlaceHolderView];
    }
    
    return self;
}

- (void)loadPlaceHolderView {
    
    _placeHolderTextView = [[UITextView alloc] initWithFrame:self.bounds];
    _placeHolderTextView.font = self.font;
    _placeHolderTextView.backgroundColor = [UIColor clearColor];
    _placeHolderTextView.textColor = [UIColor lightGrayColor];
    _placeHolderTextView.userInteractionEnabled = NO;
    
    [self addSubview:_placeHolderTextView];
    _placeHolderTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textDidChanged:(NSNotification *)notification {
    
    if (self.text.length > 0) {
        [_placeHolderTextView setHidden:YES];
    } else {
        [_placeHolderTextView setHidden:NO];
    }
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    
    _placeHolderTextView.text = placeHolder;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    
    _placeHolderTextView.textColor = placeHolderColor;
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    [self textDidChanged:nil];
}

- (void)setFont:(UIFont *)font {
    
    [super setFont:font];
    [_placeHolderTextView setFont:font];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
