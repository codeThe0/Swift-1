//
//  WangStack.swift
//  WangSwift
//
//  Created by swift on 2017/9/18.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

//swift栈的实现
public struct WangStack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}
