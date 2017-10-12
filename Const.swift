//
//  Const.swift
//  WangSwift
//
//  Created by swift on 2017/10/12.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

// MAKR: -常用宏定

// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//状态栏高度
let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.height

//导航栏高度:通用
let NAVIGATIONBAR_HEIGHT = UINavigationController().navigationBar.frame.size.height

//判断是否iphoneX
let W_IPHONEX = (Double(SCREEN_WIDTH) == Double(375.0) && Double(SCREEN_HEIGHT) == Double(812.0)) ? true : false
let W_NAVBARHEIGHT = W_IPHONEX ? Double(88.0) : Double(64.0)
let W_TABBARHEIGHT = W_IPHONEX ? Double(49.0+34.0) : Double(49.0)
let W_STATUSBARHEIGHT = W_IPHONEX ? Double(44.0) : Double(20.0)

func kColor(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
}
//常用色值
let CLEAR_COLOR = UIColor.clear
let WHITE_COLOR = UIColor.white
let LIGHT_GRAY_COLOR = UIColor.lightGray
let LOGIN_BUTTON_COLOR = kColor(red: 98, green: 198, blue: 248)

//字体大小
var kFont: (CGFloat) -> UIFont = {size in
    return UIFont.systemFont(ofSize: size);
}

