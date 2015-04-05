# byteworld
#说明文档（自己平时的一些代码总结）
###1、UITabBarController的一些总结
###2、瀑布流的实现方式（UICollection自定制展示形式）
###3、各种手势的实现方式及易出现问题的解决方法
####（1）出现多个手势时处理方法
//如果有第二个手势则第一个手势失效
[tapSingleOneFinger requireGestureRecognizerToFail:tapDoubleOneFinger];
###4、九宫格手势密码的实现封装
（1）对数组内容的操作可使用
self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];，
这样就没有必要在进行遍历
