//
//  AppDelegate.h
//  百度地图集成
//
//  Created by Kenfor-YF on 16/5/24.
//  Copyright © 2016年 Kenfor-YF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BMKMapManager *mapManager;

@end

