//
//  WangOCBridgingViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/14.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

class WangOCBridgingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "swift调用oc"
        self.view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect.init(x: 30, y: 90, width: 300, height: 50))
        label.textColor = .black
        label.text = "文字来自OC文件的方法返回值"
        self.view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 30, y: label.frame.maxY + 50, width: 300, height: 50))
        label2.textColor = .black
        let a = Test()
        label2.text = a.sayHello()
        self.view.addSubview(label2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
