//
//  JITelephoneInputTextField.m
//  JITelephoneInputTextField
//
//  Created by JerryIce on 2019/7/18.
//  Copyright © 2019 Jerry.Young. All rights reserved.
//

#import "JITelephoneInputTextField.h"

@implementation JITelephoneInputTextField


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.limitedNum = 13;
        self.numShowMode = JITelephoneInputTextField_numShowMode_default;
        self.openFirstNumLimit = NO;
        self.firstNum = 1;
        
        [self configureTextField];
    }
    return self;
}

//配置默认textfield设置
- (void)configureTextField{
    self.placeholder = @"Input telephone number";
    self.textColor = UIColor.blackColor;
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.font = [UIFont systemFontOfSize:16];
    self.borderStyle = UITextBorderStyleRoundedRect;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (BOOL)telephoneTextFieldShouldChangeCharactersInRange:(NSRange)range withValueString:(NSString *)string{
    
    //手机号限制位数
    if (self.text.length == self.limitedNum && range.length == 0) {
        return NO;
    }
    
    //显示模式
    if(self.numShowMode == JITelephoneInputTextField_numShowMode_default){
        return YES;
    }else if(self.numShowMode == JITelephoneInputTextField_numShowMode_344){
        
        NSMutableString *resStr = [NSMutableString stringWithString:self.text];
        
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]; //去除可能的首位空格
        if(string.length == 0 && range.location < self.text.length) {// 删除文本的操作
            
            NSString *removeStr = [self.text substringWithRange:NSMakeRange(range.location, range.length)];
            
            if(![removeStr isEqualToString:@" "]) {
                [resStr deleteCharactersInRange:NSMakeRange(range.location, range.length)];
                
                //剩下来的字符去除空格
                NSMutableString *modiRemainedStr = [NSMutableString stringWithString:[resStr stringByReplacingOccurrencesOfString:@" " withString:@""]];
                
                if(modiRemainedStr.length >= 3) { //插入空格
                    [modiRemainedStr insertString:@" " atIndex:3];
                }
                if(modiRemainedStr.length >= 8) { //插入空格
                    [modiRemainedStr insertString:@" " atIndex:8];
                }
                [self setText:modiRemainedStr];
            }
            
            NSString *beforeRemoveStr = nil;
            if(range.location >= 1) {
                beforeRemoveStr = [self.text substringWithRange:NSMakeRange(range.location - 1, range.length)];
                if([beforeRemoveStr isEqualToString:@" "]) {
                    [self setTextRangeWithOffset:range.location - 1];
                } else {
                    [self setTextRangeWithOffset:range.location];
                }
            }
            return NO;
        }
        
        // 输入字符
        if(string.length >0) {
            
            NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\\b"];
            if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
                return NO;
            }
            
            NSUInteger location = range.location + 1;
            if(self.openFirstNumLimit){
                if(location == 1 && ![string isEqualToString:[NSString stringWithFormat:@"%lu",(unsigned long)self.firstNum]]){
                    return NO;
                }
            }
            
            if(range.location == 3 || range.location == 8) {
                location += 1;
            }
            
            [resStr deleteCharactersInRange:NSMakeRange(range.location, range.length)];
            [resStr insertString:string atIndex:range.location];
            
            NSMutableString *modiRemainedStr = [NSMutableString stringWithString:[resStr stringByReplacingOccurrencesOfString:@" " withString:@""]];
            
            if(modiRemainedStr.length >= 4 && modiRemainedStr.length < 8) {
                [modiRemainedStr insertString:@" " atIndex:3];
            } else if(modiRemainedStr.length > 7) {
                [modiRemainedStr insertString:@" " atIndex:3];
                [modiRemainedStr insertString:@" " atIndex:8];
            }
            [self setText:modiRemainedStr];
            [self setTextRangeWithOffset:location];
            return NO;
        }
        return YES;
    }else{
        return YES;
    }
}

- (void)setTextRangeWithOffset:(NSUInteger)offset {
    UITextPosition* beginning = self.beginningOfDocument;
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:offset];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:offset];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

@end
