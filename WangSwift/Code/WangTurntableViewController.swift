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
        tt.makeActionBlock {
            //顺时针旋转。逆时针计算 0点左数：45 90 135 ...
            //计算奖项 : 100 -> 800
            tt.startPlay(withTurnAngle: 45)
        }
        //代码块
        tt.makeStop {
            let suprise = UIView()
            suprise.frame.size = CGSize(width: 100, height: 100)
            suprise.center = (UIApplication.shared.keyWindow?.center)!
            suprise.backgroundColor = .gray
            UIApplication.shared.keyWindow?.addSubview(suprise)
            //提示文字
            let label = UILabel()
            label.backgroundColor = .white
            label.textColor = .black
            label.numberOfLines = 0
            label.text = "恭喜你，中奖了！"
            suprise.addSubview(label)
            label.snp.makeConstraints({ (make) in
                make.left.right.top.bottom.equalTo(suprise)
            })
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 4, options: UIViewAnimationOptions.curveLinear, animations: {
                //执行动画
                suprise.frame.size = CGSize(width: 150, height: 150)
                suprise.center = (UIApplication.shared.keyWindow?.center)!
            }, completion: { (status) in
                suprise.frame.size = CGSize(width: 100, height: 100)
                suprise.removeFromSuperview()
                if status {
                    print("动画完成")
                } else {
                    print("不会出现这种情况")
                }
            })
        }
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
