//
//  ZYTestView.m
//  响应链机制
//
//  Created by Palmpay on 2018/4/21.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ZYTestView.h"

@interface ZYTestView()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ZYTestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tapGR];
        //初始化
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self addSubview:self.button];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.frame = CGRectMake(10, 10, 200, 100);
}

- (void)buttonDidClick:(UIButton *)btn {
    NSLog(@"我是来测试响应链的，啦啦啦啦啦啦。你不能接收事件了，啊哈哈哈");
}

- (void)tapView:(UITapGestureRecognizer *)tapGR {
    NSLog(@"听说我不能接收事件了，呜呜呜呜~~~");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"锁我喉是不");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    CGFloat changeX =curP.x - preP.x;
    CGFloat changeY = curP.y - preP.y;
    self.transform = CGAffineTransformTranslate(self.transform, changeX, changeY);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"你松开我");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"臭不要脸的。");
}

//#pragma mark -- 父控件不能接收事件
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    CGPoint btnPoint = [self.button convertPoint:point toView:self];
//    if ([self.button pointInside:btnPoint withEvent:event]) {
//        return self.button;
//    }
//    return nil;
//}

//#pragma mark -- 寻找合适的响应View的系统实现
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if ((self.userInteractionEnabled == NO) || (self.alpha <= 0.01) || (self.hidden == YES)) {
//        return nil;
//    }
//    if (![self pointInside:point withEvent:event]) {
//        return nil;
//    }
//    int count = (int)self.subviews.count;
//    for (int i = count - 1; i >= 0; i--) {
//        UIView *subView = self.subviews[i];
//        CGPoint subViewP = [self convertPoint:point toView:self];
//        UIView *view = [subView hitTest:subViewP withEvent:event];
//        if (view) {
//            return view;
//            break;
//        }
//    }
//    return nil;
//}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"点我啊" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor orangeColor]];
        [_button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        _button.userInteractionEnabled = NO;
    }
    return _button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
