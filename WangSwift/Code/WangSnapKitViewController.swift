//
//  WangSnapKitViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/15.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit
import SnapKit

class WangSnapKitViewController: UIViewController {
    
    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var view2 = {
        () -> UIView in
        let view = UIView.init()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var view3 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SnapKit使用"
        self.view.backgroundColor = .white
        
        self.view.addSubview(view1)
        view1.snp.makeConstraints { (wang) in
            wang.width.height.equalTo(50)
            wang.left.equalTo(self.view.snp.left).offset(50)
            wang.top.equalTo(self.view.snp.top).offset(100)
        }
        
        self.view.addSubview(view2)
        view2.snp.makeConstraints { (jia) in
            jia.width.height.equalTo(view1.snp.height)
            jia.left.equalTo(view1.snp.right)
            jia.bottom.equalTo(self.view.snp.bottom)
        }
        
        view3.backgroundColor = .red
        self.view.addSubview(view3)
        view3.snp.makeConstraints { (wei) in
            wei.height.equalTo(self.view.frame.size.height * 0.1)
            wei.width.equalTo(self.view.frame.size.height * 0.2)
            wei.center.equalTo(self.view.snp.center)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
