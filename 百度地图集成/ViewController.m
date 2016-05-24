//
//  ViewController.m
//  百度地图集成
//
//  Created by Kenfor-YF on 16/5/24.
//  Copyright © 2016年 Kenfor-YF. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Map/BMKPinAnnotationView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
@interface ViewController ()<BMKMapViewDelegate, BMKLocationServiceDelegate>
@property(nonatomic,weak)BMKMapView *mapView;
@property(nonatomic,strong)BMKLocationService *service;
@property(nonatomic,strong)BMKAnnotationView *selected;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BMKMapView *mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:mapView];
    self.mapView = mapView;
    self.mapView.delegate =self;
    self.service = [[BMKLocationService alloc]init];
    self.service.delegate = self;

    
    
//    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(44.5, 74.4) animated:YES];
}

- (void) viewDidAppear:(BOOL)animated {
    // 添加一个PointAnnotation
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 24.497386;
    coor.longitude = 118.144992;
    annotation.coordinate = coor;
    [_mapView addAnnotation:annotation];
    //设置地图的缩放比例
    [_mapView setZoomLevel:15];
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(24.497386,118.144992)];
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    BMKPinAnnotationView *newAnationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"anonationID"];
    ((BMKPinAnnotationView *)newAnationView).image = [UIImage imageNamed:@"poi_3"];
    ((BMKPinAnnotationView *)newAnationView).animatesDrop = YES;
    UIView *popView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 185, 56)];
    //设置弹出气泡背景图片
    UIImageView *bgImageV =[[UIImageView alloc]init];
    bgImageV.image = [[UIImage imageNamed:@"wl_map_icon_5"]stretchableImageWithLeftCapWidth:28 topCapHeight:16];
    bgImageV.frame = CGRectMake(0, 0, 185, 56);
    [popView addSubview:bgImageV];
    UIImageView *connerImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wl_map_icon_4"]];
    connerImageV.frame = CGRectMake(43, 56, 12, 6);
    [popView addSubview:connerImageV];
    UIImageView *navImageV = [[UIImageView alloc]initWithFrame:CGRectMake(120, 0, 65, 56)];
    navImageV.image = [UIImage imageNamed:@"wl_map_icon_1"];
    navImageV.userInteractionEnabled = YES;
    [bgImageV addSubview:navImageV];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"广东省中山市";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.frame = CGRectMake(0, 0, 120, 30);
    [bgImageV addSubview:titleLabel];
    UILabel *subLabel = [[UILabel alloc]init];
    subLabel.text = @"博爱五路今科科技公司";
    subLabel.textAlignment = NSTextAlignmentLeft;
    subLabel.textColor = [UIColor whiteColor];
    subLabel.font = [UIFont systemFontOfSize:12];
    subLabel.frame = CGRectMake(0, 30, 120, 26);
    [bgImageV addSubview:subLabel];
    BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc]initWithCustomView:popView];
    pView.frame = CGRectMake(0, 0, 185, 56);
    ((BMKPinAnnotationView*)newAnationView).paopaoView = nil;
    ((BMKPinAnnotationView*)newAnationView).paopaoView = pView;
    return newAnationView;
}
//点击泡泡的代理方法(实现导航功能)
-(void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view
{
    
}

@end
