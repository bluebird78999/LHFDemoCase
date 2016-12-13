//
//  LHFMVPDemoPesrsonView.m
//  LHFDemo
//
//  Created by LiuHongfeng on 11/2/15.
//  Copyright © 2015 LiuHongfeng. All rights reserved.
//

#import "LHFMVPDemoPesrsonView.h"

@implementation LHFMVPDemoPesrsonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 100, 30)];
        self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 100, 30)];
        
        [self showPersonInfo];
    }
    return self;
}

- (void)showPersonInfo
{
    if ([self.delegate respondsToSelector:@selector(laodPersonInfo)]) {
        [self.delegate laodPersonInfo];
    }
}

@end
