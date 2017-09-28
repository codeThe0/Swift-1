//
//  WangInstance.swift
//  WangSwift
//
//  Created by swift on 2017/9/28.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

let single = WangInstance()

///单例
class WangInstance: NSObject {
    
    //最正确、最简洁单例 常量形式
    static let sharedInstance = WangInstance()
    
    //单例:oc改版, dispatch在swift3种已经移除。意思就是现在不支持这种格式了。
    /*
    class func sharedInstanceTwo() -> WangInstance {
        struct Singleton{
            //static var onceToken : dispatch_once_t = 0
            static var single:WangInstance?
        }
        dispatch_once(&Singleton.onceToken,{
            Singleton.single=shareSingleTwo()
        }
        )
        return Singleton.single!
    }
     */
    
    //全局常量
    class var sharedInstanceThree : WangInstance {
        return single
    }
    
    //方法内静态常量
    static var sharedInstanceFour : WangInstance {
        struct Static {
            static let instance : WangInstance = WangInstance()
        }
        return Static.instance
    }
    
}
