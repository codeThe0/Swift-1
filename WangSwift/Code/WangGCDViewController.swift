//
//  WangGCDViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/25.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

class WangGCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GCD演示"
        self.view.backgroundColor = .white
        
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let topFrom = navBarHeight! + statusBarHeight
        
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(topFrom)
            make.height.equalTo(self.view.frame.size.width)
        }
        
        DispatchQueue.global().async {
            if let url = URL.init(string: "https://placebeard.it/355/140") {
                do {
                    let imageData = try Data(contentsOf: url)
                    let image = UIImage(data: imageData)
                    
                    DispatchQueue.main.async {
                        imageView.image = image
                        imageView.contentMode = .scaleAspectFit
                    }
                } catch {
                    print(error)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
