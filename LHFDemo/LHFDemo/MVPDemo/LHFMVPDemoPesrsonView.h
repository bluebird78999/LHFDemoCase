//
//  LHFMVPDemoPesrsonView.h
//  LHFDemo
//
//  Created by LiuHongfeng on 11/2/15.
//  Copyright © 2015 LiuHongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHFMVPPersonProtocol.h"

@interface LHFMVPDemoPesrsonView : UIView <LHFMVPPersonProtocol>

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic,weak) id<LHFMVPPersonProtocol> delegate;
@end
