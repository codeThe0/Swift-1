//
//  WangBannerViewController.swift
//  WangSwift
//
//  Created by swift on 2017/10/12.
//  Copyright © 2017年 王家伟. All rights reserved.
//

/*
 iPhoneX兼容
 未使用autolayout
 */

import UIKit
import FSPagerView

class WangBannerViewController: UIViewController, FSPagerViewDataSource,FSPagerViewDelegate {
    
    var backScrollView: UIScrollView!
    var bannerBackView: UIView!
    fileprivate let imageNames = ["banner", "help", "info"]
    fileprivate let imageTitles = ["支付", "帮助", "信息"]
    fileprivate let imageUrls = ["http://b164.photo.store.qq.com/psb?/V12MlP761F0DGV/OX2iNnVkXMH0Q1T*dE0deyVIxnIQAErGYMqtRDB3QvQ!/b/dKQAAAAAAAAA&bo=ngQlAZ4EJQEDACU!&rf=viewer_4", "http://b254.photo.store.qq.com/psb?/V12MlP761F0DGV/zYT.rkCG01W8Nc5iWZodtyOdu2NcyO3yyljFO9odYpk!/b/dP4AAAAAAAAA&bo=ngQlAZ4EJQEDACU!&rf=viewer_4", "http://b251.photo.store.qq.com/psb?/V12MlP761F0DGV/f0uBbeQELv.iXU7I17gKj39lq2ORdvMEu11KgqXK0*Y!/b/dPsAAAAAAAAA&bo=2gQUAdoEFAEDACU!&rf=viewer_4"]
    var pagerView: FSPagerView!
    var pageControl: FSPageControl!
    var statusView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //需要都是深色的背景图
        UIApplication.shared.statusBarStyle = .lightContent
        /* 暂时不添加此覆盖 : 如此会造成重复添加
         if #available(iOS 11.0, *) {
         //首先判断是否iPhoneX
         if W_IPHONEX {
         //图层添加
         self.statusView = UIView()
         statusView.backgroundColor = .white
         self.view.addSubview(statusView)
         statusView.snp.makeConstraints { (make) in
         make.left.equalTo(self.view)
         make.right.equalTo(self.view)
         make.top.equalTo(self.view)
         make.height.equalTo(44)
         }
         }
         }
         */
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if W_IPHONEX {
            if self.statusView != nil {
                self.statusView.removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createSampleView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 基础视图
    func createSampleView() {
        
        self.backScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - CGFloat(W_TABBARHEIGHT)))
        self.backScrollView.backgroundColor = .white
        self.view.addSubview(self.backScrollView)
        
        if #available(iOS 11.0, *) {
            self.backScrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        self.bannerBackView = UIView()
        self.bannerBackView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.35)
        /* iPhoneX使显示界面避开状态栏则如下操作
         if W_IPHONEX {
         //避让状态栏
         self.bannerBackView.frame = CGRect(x: 0, y: CGFloat(W_STATUSBARHEIGHT), width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.35)
         } else {
         self.bannerBackView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.35)
         }
         */
        self.bannerBackView.backgroundColor = .white
        self.bannerBackView.translatesAutoresizingMaskIntoConstraints = false
        self.backScrollView.addSubview(self.bannerBackView!)
        
        //添加操作背景
        let view1 = UIView()
        view1.frame = CGRect(x: 15, y: self.bannerBackView.frame.maxY + 15, width: SCREEN_WIDTH - 30, height: 200)
        view1.layer.masksToBounds = false
        view1.layer.cornerRadius = 6.0
        view1.layer.borderColor = UIColor.lightGray.cgColor
        view1.layer.borderWidth = 0.5
        self.backScrollView.addSubview(view1)
        //添加中间分割线
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        view1.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.center.equalTo(view1)
            make.top.equalTo(view1.snp.top).offset(10)
            make.bottom.equalTo(view1.snp.bottom).offset(-10)
            make.width.equalTo(0.5)
        }
        
        //添加二层背景
        let view2 = UIView()
        view2.frame = CGRect(x: 15, y: view1.frame.maxY + 15, width: SCREEN_WIDTH - 30, height: 200)
        view2.layer.masksToBounds = false
        view2.layer.cornerRadius = 6.0
        view2.layer.borderColor = UIColor.lightGray.cgColor
        view2.layer.borderWidth = 0.5
        self.backScrollView.addSubview(view2)
        //添加中间分割线
        let lineVie2 = UIView()
        lineVie2.backgroundColor = .lightGray
        view2.addSubview(lineVie2)
        lineVie2.snp.makeConstraints { (make) in
            make.center.equalTo(view2)
            make.top.equalTo(view2.snp.top).offset(10)
            make.bottom.equalTo(view2.snp.bottom).offset(-10)
            make.width.equalTo(0.5)
        }
        
        self.backScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: view2.frame.maxY + 15)
        
        
        
        // Create a pager view
        self.pagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: self.bannerBackView.frame.size.width, height: self.bannerBackView.frame.size.height))
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        //切换样式
        //self.pagerView.transformer = FSPagerViewTransformer(type: .depth)
        //let transform = CGAffineTransform(scaleX: 0.6, y: 0.75) //-> ..linear, .overlap
        //self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        //上部扇形
        self.pagerView.itemSize = CGSize(width: 180, height: 140)
        self.pagerView.transformer = FSPagerViewTransformer(type: .invertedFerrisWheel)
        //无限轮播
        self.pagerView.isInfinite = true
        //滚动时间
        self.pagerView.automaticSlidingInterval = 3.0
        self.bannerBackView.addSubview(self.pagerView)
        
        // Create a page control
        self.pageControl = FSPageControl(frame: CGRect(x: 0, y: self.bannerBackView.frame.size.height - UILabel().font.pointSize*1.5
            , width: SCREEN_WIDTH, height: UILabel().font.pointSize*1.5))
        self.pageControl.numberOfPages = self.imageNames.count
        self.pageControl.contentHorizontalAlignment = .right
        self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.pageControl.contentVerticalAlignment = .center
        self.pageControl.contentHorizontalAlignment = .center
        pageControl.setStrokeColor(.black, for: .normal)
        pageControl.setStrokeColor(.black, for: .selected)
        pageControl.setFillColor(.white, for: .normal)
        pageControl.setFillColor(.blue, for: .selected)
        self.bannerBackView.addSubview(self.pageControl)
    }
    
    // MARK:- FSPagerView DataSource
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        //可以使用kingfisher进行图片下载
        cell.imageView?.kf.setImage(with: URL(string: self.imageUrls[index]))
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        //自定义文字内容
        cell.textLabel?.text = self.imageTitles[index]
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        self.pageControl.currentPage = index
        print("移动到 -> \(index)")
        self.navigationController?.popViewController(animated: true)
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
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

