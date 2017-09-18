//
//  AlgorithmRun.swift
//  WangSwift
//
//  Created by swift on 2017/9/18.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

///调用
class AlgorithmRun: NSObject {
    
    //队列
    func runWangQueue() {
        var wangQueue = Queue<String>()
        wangQueue.enqueue("滴滴")
        wangQueue.enqueue("百度")
        wangQueue.enqueue("腾讯")
        wangQueue.enqueue("阿里")
        _ = wangQueue.dequeue()
        print("\(wangQueue)")
    }
    
    //栈
    func runWangStack() {
        var wangStack = WangStack<String>()
        wangStack.push("Wang")
        wangStack.push("Jia")
        wangStack.push("Wei")
        wangStack.push("niu")
        _ = wangStack.pop()
        print("\(wangStack)")
    }
    
}
