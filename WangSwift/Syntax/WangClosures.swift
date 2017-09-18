//
//  WangClosures.swift
//  WangSwift
//
//  Created by swift on 2017/9/18.
//  Copyright © 2017年 王家伟. All rights reserved.
//

/* 闭包
 { (参数) -> 返回值 in
     语句
 }
 */

import UIKit

//Swift闭包精讲: 闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数比较相似。
class WangClosures: UIViewController {
    
    let names: [String] = ["wang", "jia", "wei", "swify", "big"]
    
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    
    override func viewDidLoad() {
        
        self.title = "闭包"
        self.view.backgroundColor = .white
        
        let names1 = self.names.sorted { (s1: String, s2: String) -> Bool in
            return s1 > s2
        }
        print(names1)
        
        let names2 = self.names.sorted { (s1: String, s2: String) -> Bool in return s1 > s2}
        print(names2)
        
        let names3 = self.names.sorted { s1, s2 in return s1 > s2}
        print(names3)
        
        let names4 = self.names.sorted(by: { s1, s2 in s1 > s2 })
        print(names4)
        
        //Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：
        let names5 = self.names.sorted(by: { $0 > $1 })
        print(names5)
        
        let names6 = self.names.sorted(by: >)
        print(names6)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
}
