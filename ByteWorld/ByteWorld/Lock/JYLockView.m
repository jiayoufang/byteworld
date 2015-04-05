//
//  JYLockView.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYLockView.h"

//const定义只读的变量名，在其他的类中不能声明同样的变量名
CGFloat const btnCount = 9;
CGFloat const btnW = 74;
CGFloat const btnH = 74;
CGFloat const viewY = 300;
int const columnCount = 3;

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

//匿名扩展（类目的特例）可以声明属性
@interface JYLockView ()

@property(nonatomic,strong) NSMutableArray *selectedBtns;
@property(nonatomic,assign) CGPoint currentPoint;
@end

@implementation JYLockView

-(NSMutableArray*)selectedBtns
{
    if (!_selectedBtns) {
        _selectedBtns = [[NSMutableArray alloc]init];
    }
    return _selectedBtns;
}

//通过代码创建会调用这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addButtons];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//通过storyboard或者xib文件创建的时候回调用
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addButtons];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)addButtons
{
    CGFloat height = 0;
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        btn.userInteractionEnabled = NO;
        btn.tag = i;
        int row = i/columnCount;//第几行
        int column = i%columnCount;//第几列
        //边距
        CGFloat margin = (CGRectGetWidth(self.bounds)-columnCount*btnW)/(columnCount+1);
        //x轴
        CGFloat btnX = margin + column*(margin+btnW);
        //y轴
        CGFloat btnY = row*(btnH+margin);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        height = btnH + btnY;
        [self addSubview:btn];
    }
    
    self.frame = CGRectMake(0, viewY, kScreenWidth, height);
}

#pragma mark-private
-(CGPoint)pointWithTouch:(NSSet*)touches
{
    //拿到触摸的对象和点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    return point;
}

-(UIButton*)buttonWithPoint:(CGPoint)point
{
    //根据触摸的点拿到响应的按钮
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, point)) {
//            btn.selected = YES;
            return btn;
        }
    }
    return nil;
}

#pragma mark-触摸方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self pointWithTouch:touches];
    UIButton *btn = [self buttonWithPoint:point];
    if (btn && !btn.selected) {
        btn.selected = YES;
        [self.selectedBtns addObject:btn];//往数组或者字典中添加对象的时候，要判断这个对象是否存在
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self pointWithTouch:touches];
    UIButton *btn = [self buttonWithPoint:point];
    if (btn && !btn.selected) {
        btn.selected = YES;
        [self.selectedBtns addObject:btn];
    }else{
        self.currentPoint = point;
    }
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(lockView:didFinishPath:)]) {
        NSMutableString *path = [NSMutableString string];
        for (UIButton *btn in self.selectedBtns) {
            [path appendFormat:@"%zd",btn.tag];
        }
        [self.delegate lockView:self didFinishPath:path];
    }
    
    //将每个按钮的状态设置为NO
    [self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    [self.selectedBtns removeAllObjects];
    [self setNeedsDisplay]; 
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

-(void)drawRect:(CGRect)rect
{
    if (self.selectedBtns.count == 0) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 8.0f;
    path.lineJoinStyle = kCGLineJoinRound;
    [[UIColor colorWithRed:32/255.0f green:210/255.0f blue:254/255.0f alpha:0.5f]set];
    //遍历按钮
    for (int i = 0; i<self.selectedBtns.count; i++) {
        UIButton *btn = self.selectedBtns[i];
        if (0 == i) {//设置起点
            [path moveToPoint:btn.center];
        }else{
            //设置连线
            [path addLineToPoint:btn.center];
        }
    }
    [path addLineToPoint:self.currentPoint];
    [path stroke];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
