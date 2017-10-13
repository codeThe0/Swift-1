//
//  WangNetViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/11.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

///网络请求测试界面
class WangNetViewController: UIViewController {
    
    public let newsKey = "ab10d0327c38043562215a81bd634171"
    var textView: UITextView!
    var storeResponse: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网络请求"
        self.view.backgroundColor = .white
        
        self.ui_textView(title: "网络请求结果")
        self.get_network()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 显示请求结果
    func ui_textView(title: String) {
        self.textView = UITextView(frame: self.view.frame)
        self.storeResponse = title
        self.textView.text = self.storeResponse
        self.view.addSubview(self.textView)
    }
    
    // MARK: - 基础网络请求:GET,post
    func get_network() {
        let urlString = "https://way.jd.com/jisuapi/get?channel=头条&num=1&start=0&appkey=\(newsKey)"
        let toUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let Url = URL.init(string: toUrl!)
        let request = NSMutableURLRequest.init(url: Url!)
        request.httpMethod = "POST"//GET
        /*
        // 数据体
        var jsonData:NSData? =nil
        do {
            jsonData  = tryNSJSONSerialization.dataWithJSONObject(params, options:NSJSONWritingOptions.PrettyPrinted)
        } catch {
            
        }
        // 将字符串转换成数据
        request.HTTPBody = jsonData
         */
        let mysession = URLSession.shared
        let dataTask = mysession.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error != nil {
                return
            } else {
                let json: Any = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(json)
                self.storeResponse?.append("\n")
                self.storeResponse?.append("\(json)")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.textView.text = self.storeResponse
                    }
                }
            }
        }
        dataTask.resume()
    }
}
