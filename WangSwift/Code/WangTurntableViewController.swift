//
//  WangTurntableViewController.swift
//  WangSwift
//
//  Created by swift on 2017/10/13.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

class WangTurntableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "幸运大转盘"
        self.view.backgroundColor = .white
        
        let tt = TurntableView(frame: CGRect(x: 0, y: 100, width: SCREEN_WIDTH, height: SCREEN_WIDTH));
        tt.backgroundColor = .yellow
        self.view.addSubview(tt)
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
