import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: 常量和变量
    func letandvar() {
        // 最简单的声明方式
        let name = "王家伟"
        var age = 24
        age += 1;
        print(name)
        print(age)
        
        // 一行中声明多个变量
        let x = 0.0, y = 1.0, z = 2.5
        print(x)
        print(y)
        print(z)
        
        let π = 3.1415926
        print(π)
        
        let 你好 = "你好啊，赛利亚"
        print(你好)
        
        let 🐶 = "爪哇"
        print(🐶)
    }
    
    // MARK: 类型标注
    func typeAnnotation() {
        // 类型标注：
        var welcome: String
        welcome = "hello"
        print(welcome)
        
        // 同一行类型标注：
        var red, green, blue: Double
        red = 1.0
        green = 2.0
        blue = 3.0
        print(red)
        print(green)
        print(blue)
    }
    
    // MARK: 其它
    func other() {
        /* 多行注释
         这样的注释
         那样的注释*/
        
        // 分号：同一行多语句使用分号分割
        let 🐱 = "猫"; print(🐱)
    }
    
    // MARK: 整数、小数、浮点数、略
    
    // MARK: 类型别名
    func typeOtherName() {
        typealias WANGInt = Int
        var wangValue: WANGInt
        wangValue = 2
        print(wangValue)
    }
    
    // MARK: 布尔值
    func boolValue() {
        let yes = true
        let no = false
        print(yes)
        print(no)
    }
    
    // MARK: 元组tuples
    func tuplesType() {
        let http404error = (404, "http 404 error")
        let (statuscode, statusmessage) = http404error
        print("\(statuscode) + \(statusmessage)")
        print("\(http404error.0) + \(http404error.1)")
        
        let http200success = (statuscode: 200, statusmessage: "success")
        print("\(http200success.statuscode) + \(http200success.statusmessage)")
    }
    
    // MARK: 可选类型，有值值为x、无值
    func optionalType() {
        // surveyAnswer 被自动设置为 nil
        var surveyAnswer: String?
        print(surveyAnswer ?? "默认值，nil情况下输出，安全语言")
        surveyAnswer = "你好，可选值"
        if surveyAnswer != nil {
            print(surveyAnswer!)
        }
        // 可选绑定
        if let haveSurveyAnswer = surveyAnswer {
            print("可选绑定：有值")
            print(haveSurveyAnswer)
            print("意味着，可选值绑定到一个新的值上面，如果可选值不为空，则判断条件为真，可以执行if下的代码，否则执行else下的相关代码。")
        } else {
            print("无值")
        }
        
        // 把想要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型
        let name: String? = "可选值"
        print(name!)
        let nam2: String! = "隐式解析可选类型"
        print(nam2)
    }
    
    // MARK: 错误处理
    func canThrowAnError() throws {
        // 这个函数有可能抛出错误
    }
    
    func catchError() {
        do {
            try canThrowAnError()
            // 没有错误消息抛出
        } catch {
            // 有一个错误消息抛出
        }
    }
    
    // MARK: 断言和先决条件：
    func assertType() {
        let age = -3
        assert(age > 0, "错误时触发：一个人的年龄不能小于0")
        
        // 强制执行先决条件
        precondition(age >= 0, "条件不符合时候：一个人的年龄不正确，无法继续执行")
    }
}

