//
//  HJRefreshView.m
//  HJRefresh
//
//  Created by huangjin on 2018/4/12.
//  Copyright © 2018年 huangjin. All rights reserved.
//

#import "HJRefreshView.h"

static void * HJScrollViewRefreshContext = &HJScrollViewRefreshContext;

@interface HJRefreshView ()
@property (nonatomic ,strong) UIPanGestureRecognizer *panGestureRecongnizer;
@end

@implementation HJRefreshView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    self.backgroundColor = [UIColor whiteColor];
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview &&![newSuperview isKindOfClass:[UIScrollView class]]) {
        NSLog(@"The superview isn't kind of scrollview class so it can‘t work implement refresh function");
        return;
    }
    
    if (self.superview) {
        [self removeObserverForScrollView];
    }
    
    if (newSuperview) {
        self.scrollView = (UIScrollView *)newSuperview;
        self.scrollView.alwaysBounceVertical = YES;
        [self addObserverToScrollView];
    }
    
}

- (void)addObserverToScrollView{
    NSAssert(self.scrollView, @"refresh view can't observe notify when scollview is dragged,therefore  scollView should not be nil");
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:options context:NULL];
    [self.scrollView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentSize)) options:options context:NULL];
    self.panGestureRecongnizer = self.scrollView.panGestureRecognizer;
    [self.panGestureRecongnizer addObserver:self forKeyPath:NSStringFromSelector(@selector(state)) options:options context:NULL];
}

- (void)removeObserverForScrollView {
    [self.scrollView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset))];
    [self.scrollView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentSize))];
    [self.panGestureRecongnizer removeObserver:self forKeyPath:NSStringFromSelector(@selector(state))];
    self.panGestureRecongnizer = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (self.userInteractionEnabled) { return ;}
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(contentSize))]) {
        
    }
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(contentOffset))]) {
        
    }
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(state))]) {
        
    }
    
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change{
    
}

- (void)scrollViewContentSizeDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change{
    
    
}

- (void)scrollViewPanStateDidChange:(NSDictionary<NSKeyValueChangeKey,id> *)change{
    
    
}


- (void)dealloc {
    [self removeObserverForScrollView];
}

@end
