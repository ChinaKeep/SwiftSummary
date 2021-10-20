//
//  JITelephoneInputTextField.h
//  JITelephoneInputTextField
//
//  Created by JerryIce on 2019/7/18.
//  Copyright © 2019 Jerry.Young. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JITelephoneInputTextField_numShowMode) {
    JITelephoneInputTextField_numShowMode_default,//默认数字显示模式
    JITelephoneInputTextField_numShowMode_344,//3-4-4的数字显示模式
};

@interface JITelephoneInputTextField : UITextField


/**
 限制最大输入位数
 */
@property (nonatomic) NSUInteger limitedNum;


/**
 数字间隔显示模式
 */
@property (nonatomic) JITelephoneInputTextField_numShowMode numShowMode;


/**
 是否需要限制首位的数字为特定数字
 */
@property (nonatomic) BOOL openFirstNumLimit;

/**
 首位的数字设定为特定数字
 */
@property (nonatomic) NSUInteger firstNum;



/**
 字符改变时需要判定是否能改变，或者判定改变的逻辑
 本方法需要在UITextFieldDelegate的代理textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string的实现里调用，返回值取本方法的返回值即可。
 
 @param range 将要改变的字符范围
 @param string 将要改变为此字符
 @return 是否能够执行字符改变
 */
- (BOOL)telephoneTextFieldShouldChangeCharactersInRange:(NSRange)range withValueString:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
