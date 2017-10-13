//
//  TurntableView.h
//  WangSwift
//
//  Created by swift on 2017/10/13.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 抽奖转盘界面
 */
@interface TurntableView : UIView

#pragma mark - 常用属性
/**
 开始按钮
 */
@property (nonatomic, strong) UIButton *playButton;
/**
 旋转背景
 */
@property (nonatomic, strong) UIImageView *rotateImageView;
/**
 奖励池
 */
@property (nonatomic, strong) NSArray *prizeArray;
/**
 奖励对应图片
 */
@property (nonatomic, strong) NSArray *imagesArray;

#pragma mark - 常用方法
/**
 开始转盘
 */
- (void)startPlay;

@end
