//
//  WangSwiftTests.swift
//  WangSwiftTests
//
//  Created by swift on 2017/9/22.
//  Copyright © 2017年 王家伟. All rights reserved.
//

/*
 UnitTest = Logic + Performnnce
 单元测试 = 逻辑测试 + 性能测试
 当然这只是我简单的理解
 
 做单元测试在swift集成的时候还是存在问题
 1.无法引入文件。说真的我现在也没找到原因
 */

import XCTest

class WangSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //用来做UnitTest的方法
    func wangUnitTest() -> Int {
        var total = 0
        for i in 0...100 {
            total += i
        }
        return total
    }
    
    //逻辑测试
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let total = wangUnitTest()
        assert(total == 5050, "结果不准确")
    }
    
    
    //性能测试
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = wangUnitTest();
        }
    }
    
}
