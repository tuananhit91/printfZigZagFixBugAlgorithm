//
//  ViewController.m
//  printfZigZag
//
//  Created by admin on 7/12/15.
//  Copyright (c) 2015 iOS31. All rights reserved.
//

#import "ViewController.h"
//#import <stdio.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // line0: start n-1(Space) Space1= n-5   Space2= n+2  m(symbol +)
    // line1: start n-2        Space1= n-4   Space2= n    2m-1
    // line2: start n-3        Space1= n-2   Space2= n-2  2m-1
    // line3: start n-4        Space1= n     Space2= n-4  2m-1
    // line4: start n-5        Space1= n+2   Space2= n-5  m
    
    //    printf("    +       +       +\n");
    //    printf("   + +     + +     +\n");
    //    printf("  +   +   +   +   +\n");
    //    printf(" +     + +     + +\n");
    //    printf("+       +       +\n");

    int n=7, m=8, i, j;
    NSString *symbol = @"+";
    for (i=0; i<n ; i++) {
        if (i==0) {
            NSString *stringComplete = @"";
            stringComplete = [stringComplete stringByAppendingString:[self creatXSpace:n-1-i]];
            stringComplete = [stringComplete stringByAppendingString:symbol];
            for (j=0; j<m-1; j++) {
                // sử dụng (2*n - 3) thay cho (n + 2) ==> ta có thể thay đổi n và m mà vẫn vẽ được hình zigzag chuẩn.
                stringComplete = [stringComplete stringByAppendingString:[self creatXSpace:2*n-3]];
                stringComplete = [stringComplete stringByAppendingString: symbol];
            }
            const char *stringComplete1 = [stringComplete UTF8String];
            printf("%s\n",stringComplete1);
            
        }
        else if((0<i)&&(i<n-1))
        {
            NSString *stringComplete = @"";
            stringComplete = [stringComplete stringByAppendingString:[self creatXSpace:n-1-i]];
            stringComplete = [stringComplete stringByAppendingString:symbol];
            for (j=0; j<m-1; j++) {
                stringComplete = [stringComplete stringByAppendingString:[self creatXSpace:2*i-1]];
                stringComplete = [stringComplete stringByAppendingString:symbol];
                stringComplete = [stringComplete stringByAppendingString:[self creatXSpace:(2*n-3)-2*i]]; // (2*n-3)-2*i thay cho (n+2)-2*i
                stringComplete = [stringComplete stringByAppendingString:symbol];
            }
            const char *stringComplete1 = [stringComplete UTF8String];
            printf("%s\n", stringComplete1);
            
        }else
            {
               NSString *stringComplete = @"";
                for (j=0; j<m; j++) {
                    stringComplete = [stringComplete stringByAppendingString:symbol];
                    stringComplete = [stringComplete stringByAppendingString:[self creatXSpace:2*i-1]];
                }
                const char *stringComplete1 = [stringComplete UTF8String];
                printf("%s\n",stringComplete1);
                
            }
       
    }
    
}

- (NSString*) creatXSpace: (NSInteger) k {
    NSString *stringSpace = @"";
    for (int i=0; i<k; i++) {
        stringSpace = [stringSpace stringByAppendingString:@" "];
    }
    return stringSpace;
    
}

@end
