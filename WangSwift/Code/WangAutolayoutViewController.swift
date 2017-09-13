//
//  WangAutolayoutViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/13.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

class WangAutolayoutViewController: UIViewController {
    
    //Swift实现懒加载必须使用var关键字来定义延时加载的属性，而不可以使用let关键字，因为let关键字定义的是常量，而常量必须在实例创建时赋值
    var view1: UIView!
    var view2: UIView? = nil
    //删减了闭包的参数、返回值以及in关键字,这是在闭包赋值时的简化形式
    lazy var view3: UIView = {
        //() -> UIView in //可隐藏部分
        let newView = UIView()
        newView.backgroundColor = .yellow
        return newView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //界面基础设置
        self.title = "Autolayou布局技术"
        self.view.backgroundColor = .white
        
        //添加约束
        //默认创建之后是关闭的需要动态打开即：.isActive = true
        self.view1 = UIView.init()
        self.view1.backgroundColor = .green
        view1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.view1!)
        NSLayoutConstraint(item: self.view1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: self.view1, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: self.view1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50).isActive = true
        NSLayoutConstraint(item: self.view1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50).isActive = true
        
        //获取实例对象：加入约束
        self.view2 = UIView()
        view2?.backgroundColor = .red
        view2?.frame = CGRect(x: 100, y: 80, width: 100, height: 100)
        view2?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.view2!)
        let view2Left = NSLayoutConstraint(item: view2!, attribute: .left, relatedBy: .equal, toItem: view1, attribute: .right, multiplier: 1, constant: 50)
        let view2Top = NSLayoutConstraint(item: view2!, attribute: .top, relatedBy: .equal, toItem: view1, attribute: .bottom, multiplier: 1, constant: 50)
        let view2Width = NSLayoutConstraint(item: view2!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 200)
        let view2Height = NSLayoutConstraint(item: view2!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 100)
        let view2Constraints = [view2Left, view2Top, view2Width, view2Height]
        self.view.addConstraints(view2Constraints)

        
        //VFL语言约束：返回如上面的数组形式，内部转化
        self.view3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.view3)
        
        let myViews: [String: Any] = ["lazyView": self.view3,
                                      "superView": self.view]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lazyView(usewidth)]-20-|", options: .alignAllRight, metrics: ["usewidth": 50], views: myViews))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-300-[lazyView(50)]", options: .alignAllTop, metrics: nil, views: myViews))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     
     ### 参数定义:
     第一个参数：V:|-(>=XXX) :表示垂直方向上相对于SuperView大于、等于、小于某个距离
     若是要定义水平方向，则将V：改成H：即可
     在接着后面-[]中括号里面对当前的View/控件 的高度/宽度进行设定；
     第二个参数：options：字典类型的值；这里的值一般在系统定义的一个enum里面选取
     第三个参数：metrics：nil；一般为nil ，参数类型为NSDictionary，从外部传入 //衡量标准
     第四个参数：views：就是上面所加入到NSDictionary中的绑定的View
     
     
     ### 使用规则:
     |: 表示父视图
     -:表示距离
     V:  :表示垂直
     H:  :表示水平
     >= :表示视图间距、宽度和高度必须大于或等于某个值
     <= :表示视图间距、宽度和高度必须小宇或等于某个值
     == :表示视图间距、宽度或者高度必须等于某个值
     @  :>=、<=、==  限制   最大为  1000
     |-[view]-|:  视图处在父视图的左右边缘内
     |-[view]  :   视图处在父视图的左边缘
     |[view]   :   视图和父视图左边对齐
     -[view]-  :  设置视图的宽度高度
     |-30.0-[view]-30.0-|:  表示离父视图 左右间距  30
     [view(200.0)] : 表示视图宽度为 200.0
     |-[view(view1)]-[view1]-| :表示视图宽度一样，并且在父视图左右边缘内
     V:|-[view(50.0)] : 视图高度为  50
     V:|-(==padding)-[imageView]->=0-[button]-(==padding)-| : 表示离父视图的距离
     为Padding,这两个视图间距必须大于或等于0并且距离底部父视图为 padding。
     [wideView(>=60@700)]  :视图的宽度为至少为60 不能超过  700
     如果没有声明方向默认为  水平  V:
     
     //1.分析 NSArray 是一个闭包的返回值，而这是一个没有参数的闭包
     lazy var dataArray:NSArray = { [] }()
     //2.也可以写成这样
     lazy var dataArray:NSArray = { return NSArray() }()
     //3.从plist文件加载
     lazy var dataArray:Array<XWWine> = {
     let winePath = NSBundle.mainBundle().pathForResource("wine.plist", ofType: nil)!
     let winesM = NSMutableArray(contentsOfFile: winePath);
     var tmpArray:Array<XWWine>! = []
     for tmpWineDict in winesM! {
     var wine:XWWine = XWWine.wineWithDict(tmpWineDict as! NSDictionary)
     tmpArray.append(wine)
     }
     print("我就运行一次")
     return tmpArray }()
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
