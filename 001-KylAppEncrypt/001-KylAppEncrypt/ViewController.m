//
//  ViewController.m
//  001-KylAppEncrypt
//
//  Created by 孔雨露 on 2019/12/14.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ViewController.h"
#import "KEncryptionTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testEncrpytion];
    
}

- (void) testEncrpytion {
    /** AES - ECB */
    NSString * key = @"abc";
    NSString * encStr = [[KEncryptionTool shared] encryptString:@"hello" keyString:key iv:nil];
    
    NSLog(@"加密的结果是：%@",encStr);
    
    NSLog(@"解密的结果是：%@",[[KEncryptionTool shared] decryptString:encStr keyString:key iv:nil]);
    
    /** AES - CBC 加密 */
    uint8_t iv[8] = {1,2,3,4,5,6,7,8};
    NSData * ivData = [NSData dataWithBytes:iv length:sizeof(iv)];
    
    
    
    NSLog(@"CBC加密：%@",[[KEncryptionTool shared] encryptString:@"hello" keyString:@"abc" iv:ivData]);
    
    NSLog(@"解密：%@",[[KEncryptionTool shared] decryptString:@"u3W/N816uzFpcg6pZ+kbdg==" keyString:key iv:ivData]);
}


@end
