//
//  CPlusArrayController.m
//  TestSwiftApplication
//
//  Created by Keep on 2022/5/18.
//

#import "CPlusArrayController.h"

@interface CPlusArrayController ()<CAAnimationDelegate>
@property (nonatomic, assign)   int     animationDuration;
@property (nonatomic, assign)   UIView  * aniView;
@end

@implementation CPlusArrayController
double radians(float degress){
    return (degress * 3.1415926)/180.0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    //数组作为整体使用，求大小，取地址
//    int a[10];
//    printf("%d\n",sizeof(a)); //40
//    printf("%d\n",sizeof(int[10])); //40
//
//
//    printf("%d\n",sizeof(&a)); //8
//
//    printf("%p\n",&a); //0x16f9633c0
//    printf("%p\n",&a+1);//0x16f9633e8 中间差了28 10进制为40
//
//
//    int(*p)[10] = &a; 数组指针类型
//    printf("%d\n",sizeof(p)); //8
    
    printf("=======\n");
    //指针的本质： 有类型的地址
    int a[5] = {1,2,3,4,5};
    /*
     &a + 1 取地址按照整体使用 +1 之后到 5后面了
     数组指针 x（int*） ==变成了 int*指针
     也就是说由 原来的数组指针 变为 int* 指针，指向从数组 变为 单个数组内容
     (int*)(&a+1) 此时指向的范围变小了 指向的是第6个
     ((int*)(&a+1)-1) 此时如果-1 就是减一个int类型 也就是到5的地址
     
     此时是int* 类型的 再进行取 *
     int*的位置上放的就是5 此时对这个地址进行取值
     此时取到的值是5
     */

    printf("%d\n",*((int*)(&a+1)-1)); //5
    /*
     ((int*)(&a+1)) 外层的大括号代表取内容
     */
    printf("%d\n",((int*)(&a+1))[-2] );
    
    printf("=%d\n",*(int*)(&a+1));
    
    

    
    
}

// 防盗水印动画
- (void)waterMoveAnimation{
    
    self.animationDuration = 25;
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 50, 100, 20);
    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
    self.aniView = view;
    
    [self tipAnimation:view fromPoint:view.center
               toPoint:CGPointMake(self.view.frame.size.width- view.frame.size.width, self.view.frame.size.height - view.frame.size.height)
                 angle: radians(30.0)];
}
#pragma mark 动画
- (void)tipAnimation:(UIView *)tipView fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint angle:(CGFloat)angle{
    //平移
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    CGPoint newtoPoint  = CGPointZero;
    if (self.aniView.center.x > self.view.frame.size.width - 120) {
        newtoPoint = CGPointMake(toPoint.x , toPoint.y) ;
    }else{
        newtoPoint = CGPointMake(fromPoint.x + toPoint.x , fromPoint.y + toPoint.y) ;
    }
    NSLog(@"移动中：%@",NSStringFromCGPoint(newtoPoint));
    [movePath addLineToPoint:newtoPoint];
    //移动的新中心点赋值
    self.aniView.center = newtoPoint;
    
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.duration = self.animationDuration;
    moveAnim.repeatCount = 1;
    moveAnim.removedOnCompletion = NO;
    moveAnim.fillMode = kCAFillModeForwards;
    moveAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //旋转
//    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
//    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    //沿Z轴旋转
//    TransformAnim.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(angle,0,0,1)];
//    TransformAnim.cumulative = YES;
//    TransformAnim.duration = 10;
//    TransformAnim.repeatCount = FLT_MAX;
//    tipView.center = toPoint;
//    TransformAnim.removedOnCompletion = NO;
//    TransformAnim.fillMode = kCAFillModeForwards;
//    TransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    CABasicAnimation *TransformAnim = [CABasicAnimation animation];
   //必须加上transform才行，不然不起作用，z表示绕z轴旋转
    TransformAnim.keyPath = @"transform.rotation.z";
     //M_PI_2表示90度，在旋转时，使用度数都是使用类似的表达,M_PI代表180度的意思
    TransformAnim.byValue = @(M_PI_4);
    TransformAnim.beginTime = 0.f;
    TransformAnim.duration = 1.0f;
     //动画后保持最终的动画状态
    TransformAnim.removedOnCompletion = NO;
    TransformAnim.fillMode = kCAFillModeForwards;
    
    //动画组
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, TransformAnim, nil];
    animGroup.duration = self.animationDuration;
    animGroup.repeatCount = 1;
    animGroup.removedOnCompletion = NO;
    animGroup.delegate = self;
    animGroup.fillMode = kCAFillModeForwards;
    
    [tipView.layer addAnimation:animGroup forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"移动结束点：%@",NSStringFromCGPoint(self.aniView.center));
    if (self.aniView.center.x > self.view.frame.size.width - 120) {
        [self tipAnimation:self.aniView
                 fromPoint:self.aniView.center
                   toPoint:CGPointMake(100, 100)
                     angle:30];
    }else{
        [self tipAnimation:self.aniView
                 fromPoint:self.aniView.center
                   toPoint:CGPointMake(self.view.frame.size.width - 100, self.view.frame.size.height - 150)
                     angle:30];
    }
   
}

@end
