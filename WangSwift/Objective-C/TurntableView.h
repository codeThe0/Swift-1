//
//  TurntableView.h
//  WangSwift
//
//  Created by swift on 2017/10/13.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import <UIKit/UIKit.h>

//代码块声明
typedef void(^RotateStopBlock)(void);
typedef void(^BtnActionBlock)(void);

/**
 抽奖转盘界面
 */
@interface TurntableView : UIView

#pragma mark - 常用属性
/**
 停止回调
 */
@property (nonatomic, copy) RotateStopBlock stopBlock;
/**
 按钮点击回调
 */
@property (nonatomic, copy) BtnActionBlock actionBlock;
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
 旋转转盘
 @param turnAngle 终止角度
 */
- (void)startPlayWithTurnAngle:(NSInteger)turnAngle;

/**
 停止回调方法

 @param stopBlock 停止回调代码块
 */
- (void)makeStopBlock:(RotateStopBlock)stopBlock;

/**
 按钮点击回调函数

 @param actionBlock 按钮点击执行代码块
 */
- (void)makeActionBlock:(BtnActionBlock)actionBlock;

@end
