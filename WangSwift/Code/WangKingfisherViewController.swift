//
//  WangKingfisherViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/15.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit
import Kingfisher

class WangKingfisherViewController: UIViewController {
    
    lazy var imageView = UIImageView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "使用Kingfisher"
        self.view.backgroundColor = .white
        
        imageView.backgroundColor = .green
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (wangjiawei) in
            wangjiawei.left.equalTo(self.view.snp.left)
            wangjiawei.right.equalTo(self.view.snp.right)
            wangjiawei.center.equalTo(self.view.snp.center)
            wangjiawei.height.equalTo(self.view.snp.width)
        }
        
        //Http请求需要允许infoplist设置
        let url = URL(string: "http://wangjiawei.wang/images/swift.gif")
        imageView.kf.setImage(with: url, placeholder: UIImage.init(named: "test"), options: nil, progressBlock: { (ing, still) in
            
        }) { (image, error, cacheType, url) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
