# ZJProgressHUD
一个类似MBProgressHUD的提示控件, 效果还不错, 实现也很简单, 方便参考和自定义



* [ZJProgressHUD 自已写个MBProgressHUD](https://github.com/jasnig/ZJPPTViewOC), 经常使用MBProgressHUD? 不妨自己动手来写一个, 反正也不难. 


![progressHUD.gif](http://upload-images.jianshu.io/upload_images/1271831-73775fa874dc1a43.gif?imageMogr2/auto-orient/strip)



```
 // 显示加载成功的图片和文字提示, 1s后自动隐藏
            [ZJProgressHUD showSuccessWithStatus:@"加载成功!!" andAutoHideAfterTime:1.f];
            // 显示加载动画, 需要加载完成后调用hideHUD隐藏
            [ZJProgressHUD showProgressWithStatus:@"正在努力加载中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [ZJProgressHUD hideHUD];
            });
```