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

> 这是我写的<iOS_CUSTOMIZE_ANALYSIS>这本书籍中的一个demo, 如果你希望知道具体的实现过程和其他的一些常用效果的实现, 那么你应该能轻易在网上下载到免费的盗版书籍. 

> 当然作为本书的写作者, 还是希望有人能支持正版书籍. 如果你有意购买书籍, 在[这篇文章中](http://www.jianshu.com/p/510500f3aebd), 介绍了书籍中所有的内容和书籍适合阅读的人群, 和一些试读章节, 以及购买链接. 在你准备购买之前, 请一定读一读里面的说明. 否则, 如果不适合你阅读, 虽然书籍售价35不是很贵, 但是也是一笔损失.


> 如果你希望联系到我, 可以通过[简书](http://www.jianshu.com/users/fb31a3d1ec30/latest_articles)联系到我
