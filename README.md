### swift

```
代码知识点：
✔    纯代码
✔    UI组件
✔    网络请求
✔    第三方库使用
✘    更多代码正在挖掘...
```
### 介绍
|文件名|作用|
|---|---|
|AppDelegate|纯代码创建window视图|
|ViewController|纯代码tableview、根视图列表|
|WangUIViewController|基本UI控件集合|
|WangNetViewController|网络请求代码|
|WangAlamofireAndSwiftyJSONViewController|Alamofire + SwiftyJSON库使用|

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
