# BaiduLoading


### 添加到window视图

```objc
@implementation AppDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加到window试图

    [loadingView beginAnimation];
  
    
}
@end
```
### 添加到自定义视图

```objc
@implementation AppDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加到自定义视图
      [loadingView showLoadingViewInView:self.view]; 

}
@end
```
### 结束加载动画

```objc
@implementation AppDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [loadingView stopAnimation];


}
@end
```
