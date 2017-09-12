//
//  WangAlamofireAndSwiftyJSONViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/12.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WangAlamofireAndSwiftyJSONViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Alamofire + SwiftyJSON使用"
        self.view.backgroundColor = .white
        
        useAlamofire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func useAlamofire() {
        //?channel=头条&num=1&start=0&appkey=\(newsKey)"
        Alamofire.request("https://way.jd.com/jisuapi/get", parameters: ["channel": "头条", "num": "1", "start": "0", "appkey": "ab10d0327c38043562215a81bd634171"]).responseJSON { (response) in
            print("\(response.result)")
            print("\(String(describing: response.response))")
            let json: [String: Any] = try! JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String : Any]
            
            //可选值获取指定属性
            if let channelValue1 = ((json["result"] as? [String: Any])?["result"] as?[String: Any])?["channel"] as? String {
                print("channelValue1的值为:\(channelValue1)")
            }
            //swiftjson
            let jsons = JSON(data: response.data!)
            if let channelValue = jsons["result"]["result"]["channel"].string {
                print(channelValue)
            }
        }
    }
    
}
