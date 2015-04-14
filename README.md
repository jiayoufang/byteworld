# byteworld
#说明文档（自己平时的一些代码总结）
###1、UITabBarController的一些总结
###2、瀑布流的实现方式（UICollection自定制展示形式）
###3、各种手势的实现方式及易出现问题的解决方法
####（1）出现多个手势时处理方法
//如果有第二个手势则第一个手势失效
[tapSingleOneFinger requireGestureRecognizerToFail:tapDoubleOneFinger];
###4、九宫格手势密码的实现封装 JYLockViewController
（1）对数组内容的操作可使用
self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];，
这样就没有必要在进行遍历
###5、系统功能JYSystemViewController
####（1）获取设备ip
####（2）iOS8跳转至系统设置界面
####（3）设备振动
###6、设备启动时候的引导页JYIntrolViewController
####(1)单一的左右滑动
###7、程序内部的引导方式加入JYHoledViewController
####（1）白色透明 圆形 方形和自定义控件
###8、玻璃模糊效果JYBlurViewController
###9、各种数据类型JYFoundation（一些类别和操作方法）
####(1)NSObject NSData NSArray  NSString 
###10、各种控件的一些效果和功能封装JYKit
####（1）UIView+JYScreenView 截屏
####（2）UITextView 大小随文字多少自适应 有默认文字
####（3）UIImage 根据颜色生成图片 产生缩略图 图片模糊效果
####（4）UIButton 将不同状态不设置图片，设置颜色
####（5）UILabel 自适应  竖直方向居中  自动写字动画  默认有删除线或额外的符号
####（6）UITableView  类似QQ控件效果（图片变大、navigationbar渐隐）
###11、类似QQ列表的实现 JYListViewController
