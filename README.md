# WangSwift
Swift搭建项目、纯代码

### Swift代码知识点：
* 纯代码
* UI组件
    * UIWindow
    * UITabBarController
    * UINavigationController
    * UIViewController
    * UIView
    * UIButton
    * UILabel
    * UITextField
    * UITextView
    * UIScrollView
    * UITableView
    * UITableViewCell
* 网络请求
    * GET
    * POST
    * ...
* 第三方库使用
    * 网络解析：[Alamofire](https://github.com/Alamofire/Alamofire)
    * JSON解析：[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
    * 约束布局：[SnapKit](https://github.com/SnapKit/SnapKit)(暂未支持swift4)
    * 图片加载：[KingFisher](https://github.com/onevcat/Kingfisher)(暂未支持swift4)
    * 桥接引入：OC库稍后加入
* 更多功能逐渐添加
    * swift4基础语法示例代码
    * 自定义视图
    * swift动画

### 介绍
|文件名|作用|
|---|---|
|[AppDelegate](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/AppDelegate.swift)|纯代码创建window视图|
|[ViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/ViewController.swift)|纯代码tableview、根视图列表|
|[WangUIViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangUIViewController.swift)|基本UI控件集合|
|[WangNetViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangNetViewController.swift)|网络请求代码|
|[WangAlamofireAndSwiftyJSONViewController](https://github.com/wang542413041/WangSwift/blob/master/WangSwift/Code/WangAlamofireAndSwiftyJSONViewController.swift)|Alamofire + SwiftyJSON库使用|

### 示例代码
```Swift
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //整体框架搭建
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
        return true
    }
```
