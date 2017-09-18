//
//  WangQueue.swift
//  WangSwift
//
//  Created by swift on 2017/9/18.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

//swift队列实现
public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}

