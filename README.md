# WangSwift
3天开发iOS APP
```Swift
func learn(fromLangeage: OC) -> Swift { 
    return WangSwift
}
```
![思维导图](https://github.com/wang542413041/picturesFactory/blob/master/Swift%E5%9F%BA%E6%9C%AC%E8%AF%AD%E6%B3%95%E6%80%9D%E7%BB%B4%E5%AF%BC%E5%9B%BE.png?raw=true)

* 联系方式
    * QQ : 542413041
    * 邮箱 : (542413041@qq.com)
    * [博客](http://www.wangjiawei.wang)
    * [微博](http://weibo.com/u/3193598595)
 
* 基于Swift4、XCode9
    * [Swift项目规划](#Swift项目规划)
    * [Swift文件介绍](#Swift文件介绍)
    * [Swift开源模板](#Swift开源模板)
    * [Swift代码模板](#Swift代码模板)
    * [Swift网络原生](#Swift网络原生)
    * [Swift约束布局](#Swift约束布局)
    * [Swift的懒加载](#Swift的懒加载)
    * [Swift闭包使用](#Swift闭包使用)
    * [Swift代理传值](#Swift代理传值)
    * [Swift桥接混编](#Swift桥接混编)
    * [Swift底层实践](#Swift底层实践)
    * [Swift单例实现](#Swift单例实现)
    
### Swift项目规划
* 纯代码 VS 故事板 -.- Code VS StoryBoard
    * 优势：高度自定义，二期开发容易 / 开发速度快，飞起
    * 劣势：开发速度慢，不符合潮流 / 二次开发复杂不好团队协作
* 更多功能逐渐添加
    * swift4基础语法示例代码
    * 自定义视图
    * swift动画
    
### Swift文件介绍
|文件名|作用|
|---|---|
|[AppDelegate](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/AppDelegate.swift)|纯代码创建window视图|
|[ViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/ViewController.swift)|纯代码tableview、根视图列表、闭包回调传值调用|
|[WangUIViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangUIViewController.swift)|基本UI控件集合、闭包之回调传值、代理之回调传值|
|[WangNetViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangNetViewController.swift)|网络请求代码|
|[WangAlamofireAndSwiftyJSONViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangAlamofireAndSwiftyJSONViewController.swift)|Alamofire + SwiftyJSON库使用|
|[WangAutolayoutViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangAutolayoutViewController.swift)|swift原生Autolayout三种约束形式、懒加载使用|
|[WangOCBridgingViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangOCBridgingViewController.swift)|swift与oc混编|
|[WangSnapKitViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangSnapKitViewController.swift)|Swift的SnapKit约束布局使用|
|[WangKingfisherViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangKingfisherViewController.swift)|异步图片加载|
|[WangStack](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Algorithm/WangStack.swift)|swift栈的实现|
|[WangQueue](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Algorithm/WangQueue.swift)|swift队列的实现|
|[AlgorithmRun](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Algorithm/AlgorithmRun.swift)|Algorithm调用实践|
|[WangUnitTest](https://github.com/wang542413041/WangSwift/blob/master/WangSwiftTests/WangSwiftTests.swift)|swift单元测试代码|
|[WangGCDViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangGCDViewController.swift)|swift的GCD下载图片示例|
|[WangCustomCell](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangCustomTableViewCell.swift)|自定义tableviewcell|
|[WangInstance](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangInstance.swift)|单例模式|

### Swift开源模板
* 第三方库使用
    * 网络解析：[Alamofire](https://github.com/Alamofire/Alamofire)
    ```Swift
     func useAlamofire() {
        //?channel=头条&num=1&start=0&appkey=\(newsKey)"
        Alamofire.request("https://way.jd.com/jisuapi/get", parameters: ["channel": "头条", "num": "1", "start": "0", "appkey": "ab10d0327c38043562215a81bd634171"]).responseJSON { (response) in
            print("\(response.result)")
            print("\(String(describing: response.response))")
            let json: [String: Any] = try! JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String : Any]
            //可选值获取指定属性
            if let channelValue1 = ((json["result"] as? [String: Any])?["result"] as?[String: Any])?["channel"] as? String {
                print("channelValue1的值为:\(channelValue1)")
            }
            //swiftjson
            let jsons = JSON(data: response.data!)
            if let channelValue = jsons["result"]["result"]["channel"].string {
                print(channelValue)
            }
        }
    }
    ```
    * JSON解析：[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
    ```Swift
    //可选值获取指定属性
    if let channelValue1 = ((json["result"] as? [String: Any])?["result"] as?[String: Any])?["channel"] as? String {
      print("channelValue1的值为:\(channelValue1)")
    }
    //swiftjson
    let jsons = JSON(data: response.data!)
    if let channelValue = jsons["result"]["result"]["channel"].string {
      print(channelValue)
    }
    ```
    * 约束布局：[SnapKit](https://github.com/SnapKit/SnapKit) -> 3.2.0修改一个rawValue值问题，及其他语法修改API即可.
    ```Swift
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
    ```
    * 图片加载：[KingFisher](https://github.com/onevcat/Kingfisher) -> 4.0.1支持Swift4
    ```Swift
    //Http请求需要允许infoplist设置
    let url = URL(string: "http://wangjiawei.wang/images/swift.gif")
    imageView.kf.setImage(with: url, placeholder: UIImage.init(named: "test"), options: nil, progressBlock: { (ing, still) in
    
    }) { (image, error, cacheType, url) in
    
    }
    ```
    
### Swift代码模板
* UI组件
    * UIWindow
    ```Swift
    self.window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    let wangViewController = ViewController()
    wangViewController.title = "swift项目纯代码示例"
    let wangNavigationViewController = UINavigationController.init(rootViewController: wangViewController)
    wangNavigationViewController.tabBarItem.title = "王家伟"
    wangNavigationViewController.tabBarItem.image = UIImage(named: "test")
    let wangTabBarViewController = UITabBarController.init()
    wangTabBarViewController.setViewControllers([wangNavigationViewController], animated: true)
    self.window?.rootViewController = wangTabBarViewController
    self.window?.makeKeyAndVisible()
    ```
    * UITabBarController
    ```Swift
    let wangTabBarViewController = UITabBarController.init()
    wangTabBarViewController.setViewControllers([wangNavigationViewController], animated: true)
    ```
    * UINavigationController
    ```Swift
    let wangNavigationViewController = UINavigationController.init(rootViewController: wangViewController)
    wangNavigationViewController.tabBarItem.title = "王家伟"
    wangNavigationViewController.tabBarItem.image = UIImage(named: "test")
    ```
    * UIViewController
    ```Swift
    let wangViewController = ViewController()
    wangViewController.title = "swift项目纯代码示例"
    ```
    * UIView
    ```Swift
    let view = UIView()
    ```
    * UIImageView
    ```Swift
    func make_imageview() {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        imageView.image = UIImage(named: "test")
        self.myScroll.addSubview(imageView)
    }
    ```
    * UIButton
    ```Swift
    // MARK: - 按钮
    func make_button() {
        let btn = UIButton(frame: CGRect(x: 0, y: 150, width: 100, height: 50))
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("按钮", for: .normal)
        btn.setTitle("点击", for: .highlighted)
        btn.addTarget(self, action: #selector(btnTap(_:)), for: .touchUpInside)
        self.myScroll.addSubview(btn)
    }
    
    //@objc
    @objc func btnTap(_ mybtn: UIButton) {
        print(mybtn.titleLabel?.text ?? "无值")
        print("点击了按钮")
        make_alert()
    }
    ```
    * UILabel
    ```Swift
    func make_label() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = "这年头傻逼真多"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        self.myScroll.addSubview(label)
    }
    ```
    * UITextField
    ```Swift
    // MARK: - 输入框
    func make_textfield() {
        let textField = UITextField(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 50))
        textField.placeholder = "请输入一些内容"
        self.myScroll.addSubview(textField)
    }
    ```
    * UITextView
    ```Swift
    func make_textView() {
        let textView = UITextView(frame: CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 50))
        textView.text = "sakhfjkhadsjfhjasdhfjhadsjklfhuhc vkjhuahdsfuhakdshfluasdhfjklhasdjklfhjalskdfhsakdljfhalskdjhfusadhfkhasdjkfhjkalsdhflkajsdhfjklasdhfljaksdhflkjasdhfajksdhffuiwhqeiucbqwuiebvquywegrwbcuqwe"
        self.myScroll.addSubview(textView)
    }
    ```
    * UIScrollView
    ```Swift
    func make_scrollview() {
        myScroll = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        myScroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000.0)
        myScroll.backgroundColor = .groupTableViewBackground
        self.view.addSubview(myScroll)
    }
    ```
    * UITableView
    ```Swift
    self.baseTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 40), style: .plain)
    self.baseTableView.delegate = self
    self.baseTableView.dataSource = self
    self.baseTableView.register(UITableViewCell.self, forCellReuseIdentifier: myTableViewReuseIdentifer)
    self.baseTableView.separatorStyle = .singleLine
    self.baseTableView.tableFooterView = UIView()
    self.view.addSubview(self.baseTableView)
    ```
    * UITableViewCell
    ```Swift
    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: myTableViewReuseIdentifer, for: indexPath)
    if cell == nil {
        cell = UITableViewCell(style: .default, reuseIdentifier: myTableViewReuseIdentifer)
    }
    cell?.textLabel?.text = itemList[indexPath.row]
    ```
    * UIAlertController
    ```Swift
    // MARK: - 弹出框
    func make_alert() {
        let alert = UIAlertController(title: "提示", message: "提示框界面", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (_: UIAlertAction) in
            print("点击确定按钮")
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("点击取消按钮")
        }))
        self.present(alert, animated: true) {
            
        }
    }
    
    // MARK: - 弹出选择框
    func make_actionSheet() {
        let actionSheet = UIAlertController(title: "标题", message: "显示的信息", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "底部默认", style: .default, handler: { (_: UIAlertAction) in
            print("sheet底部弹窗")
        }))
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("取消")
        }))
        self.present(actionSheet, animated: true) {
            
        }
    }
    ```
### Swift网络原生
* 网络请求
    * GET
    ```Swift
    // MARK: - 基础网络请求:GET,post
    func get_network() {
        let urlString = "https://way.jd.com/jisuapi/get?channel=头条&num=1&start=0&appkey=\(newsKey)"
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
                self.storeResponse?.append("\n")
                self.storeResponse?.append("\(json)")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.textView.text = self.storeResponse
                    }
                }
            }
        }
        dataTask.resume()
    }
    ```
    * POST
    ```Swift
    let request = NSMutableURLRequest.init(url: Url!)
    request.httpMethod = "POST"//GET
    // 数据体
    var jsonData:NSData? =nil
    do {
        jsonData  = tryNSJSONSerialization.dataWithJSONObject(params, options:NSJSONWritingOptions.PrettyPrinted)
    } catch {
    
    }
    // 将字符串转换成数据
    request.HTTPBody = jsonData
    ```
    * 其它...

### Swift约束布局
* Autolayout
    * 方式一：.isActive = true
    ```Swift
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
    ```
    * 方式二：self.view.addConstraints()
    ```Swift
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
    ```
    * 方式三：
    ```Swift
    //VFL语言约束：返回如上面的数组形式，内部转化
    self.view3.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(self.view3)
    let myViews: [String: Any] = ["lazyView": self.view3, "superView": self.view]
    self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lazyView(usewidth)]-20-|", options: .alignAllRight, metrics: ["usewidth": 50], views: myViews))
    self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-300-[lazyView(50)]", options: .alignAllTop, metrics: nil, views: myViews))
    ```

### Swift的懒加载
* 懒加载
    * 简介：在用到的时候对代码进行创建，用不到不创建。
    ```Swift
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
    ```
   * 本项目示例代码：
   ```Swift
   //删减了闭包的参数、返回值以及in关键字,这是在闭包赋值时的简化形式
    lazy var view3: UIView = {
        //() -> UIView in //可隐藏部分
        let newView = UIView()
        newView.backgroundColor = .yellow
        return newView
    }()
   ```
### Swift闭包使用
* swift闭包
    * Closures：闭包，闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数比较相似。闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作。
    * 项目内应用：反向传值
        * 闭包声明
        ```Swift
        //闭包名称：{ (parameters) -> returnType in statement }
        typealias WangButtonClosures = (String, String) -> ()
        ```
        * 闭包赋值方法声明
        ```Swift
        var myButtonClosures: WangButtonClosures?
        /* 或者使用实例方法调用（方法名字不固定，但参数是必须的） 不推荐
        func setMyButtonClosures(tempClose: @escaping WangButtonClosures)  {
            self.myButtonClosures = tempClose
         }
         */
        ```
        * 闭包当前界面调用传值
        ```Swift
        self.myButtonClosures!("修改了UI图形标题", "多参数")
        ```
        * 闭包回调结果调用
        ```Swift
        let vc = WangUIViewController()
        vc.hidesBottomBarWhenPushed = true
        weak var WeakSelf = self
        vc.myButtonClosures = { (text, text2) -> () in
            //重新获取strong self
            let strSelf = WeakSelf
            strSelf?.itemList[0] = text
            strSelf?.baseTableView.reloadData()
            print("多余的参数：\(text2)")
        }
        self.navigationController?.pushViewController(vc, animated: true)
        ```
        
### Swift代理传值
* Swift代理传值
    * 创建代理
    ```Swift
    //代理模式: 1.@objc 2.:class
    protocol WangProtocol: class {
        func wangProtocolChangeName(name: String)
    }
    ```
    * 本页代理调用
    ```Swift
    weak var delegate: WangProtocol?
    self.delegate?.wangProtocolChangeName(name: "我想要改变的_王家伟")
    ```
    * 其它页面代理使用
    ```Swift
    //遵循
    class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WangProtocol {}
    vc.delegate = self
    //遵循代理
    func wangProtocolChangeName(name: String) {
        //重新获取strong self
        self.itemList[1] = name
        self.baseTableView.reloadData()
    }
    ```

### Swift桥接混编
* swift混编oc
    * 自创建混编
        * 创建oc文件，同时会提示创建桥接文件。直接点同意就可以，如果想自己创建也可以。
        * 自创建桥接文件（可省略）:SWIFT_OBJC_BRIDGING_HEADER = WangSwift-Bridging-Header.h
        * 在桥接文件导入要用的.h文件
        * 在swift中直接调用即可
        ```Objective-C
        #import "Test.h"
        ```
    * pod导入混编
        * 基本步骤同上，但是导入的都变成了静态库需要修改一些问题：use_framework!
        * 首先要确认是否可以寻找到静态库头文件
        * 其它问题，等稍后导入介绍

### Swift底层实践
* 常用数据结构
    * 栈实现
    ```Swift
    public struct WangStack<T> {
    fileprivate var array = [T]()
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    public mutating func push(_ element: T) {
        array.append(element)
    }
    public mutating func pop() -> T? {
        return array.popLast()
    }
    public var top: T? {
        return array.last
    }
    }
    ```
    * 队列实现
    ```Swift
    public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
    }
    ```
* 基础语法
    * 闭包:
    ```Swift
    { (参数) -> 返回值 in 语句 }
    ```

### 单例实现
* 单例创建方式
    * 最正确、最简洁单例 常量形式
    ```Swift
    static let sharedInstance = WangInstance()
    ```
    * 全局常量
    ```Swift
    //类外创建
    let single = WangInstance()
    //类内
    class var sharedInstanceThree : WangInstance {
        return single
    }
    ```
    * 方法内静态常量
    ```Swift
    static var sharedInstanceFour : WangInstance {
        struct Static {
            static let instance : WangInstance = WangInstance()
        }
        return Static.instance
    }
    ```
    * <del>OC迁移至Swfit dispatch方式 已废弃</del>
    ```Swift
    class func sharedInstanceTwo() -> WangInstance {
        struct Singleton{
            //static var onceToken : dispatch_once_t = 0
            static var single:WangInstance?
        }
        dispatch_once(&Singleton.onceToken,{
            Singleton.single=shareSingleTwo()
        }
        )
        return Singleton.single!
    }
    ```
