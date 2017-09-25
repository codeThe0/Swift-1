//
//  WangCATransform3DViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/25.
//  Copyright © 2017年 王家伟. All rights reserved.
//

/*
 适配知识
             iPhone  iPhoneX
 statusbar   20      44
 
 */

import UIKit

class WangCATransform3DViewController: UIViewController {
    
    lazy var blueView: UIView = {
        () -> UIView in
        let newView = UIView()
        newView.backgroundColor = .blue
        return newView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CATransform3D"
        self.view.backgroundColor = .white
        
        self.view.addSubview(blueView)
        self.blueView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        
        let bottomView = UIView()
        bottomView.backgroundColor = .groupTableViewBackground
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(50)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -   方法
    func viewTransform() {
        let transform = CATransform3DIdentity
        let angle = CGFloat(45)
        self.blueView.layer.transform = CATransform3DRotate(transform, angle, 0, 1, 0)
    }
}
