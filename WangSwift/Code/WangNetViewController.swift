//
//  WangNetViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/11.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

class WangNetViewController: UIViewController {
    
    let newsKey = "ab10d0327c38043562215a81bd634171"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网络请求"
        self.view.backgroundColor = .white
        
        self.base_network()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 基础网络请求
    func base_network() {
        let urlString = "https://way.jd.com/jisuapi/get?channel=头条&num=10&start=0&appkey=\(newsKey)"
        let toUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let Url = URL.init(string: toUrl!)
        let request = NSMutableURLRequest.init(url: Url!)
        let mysession = URLSession.shared
        let dataTask = mysession.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error != nil {
                return
            } else {
                let json: Any = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(json)
            }
        }
        dataTask.resume()
    }
}
