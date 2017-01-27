//
//  ViewController.swift
//  WeatherIcon
//
//  Created by 大石　弘一郎 on 2017/01/27.
//  Copyright © 2017年 大石　弘一郎. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftOpenWeatherMapAPI

class ViewController: UIViewController {

    var locationManager: CLLocationManager! = nil
    var longitude: CLLocationDegrees!
    var latitude: CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let weatherAPI = WAPIManager(apiKey: "9eeaea80076ac9f4b5f19ec445d707f3", temperatureFormat: .Celsius, lang: .English)
//
//        weatherAPI.currentWeatherByCityNameAsJson(cityName: "London") {
//            (WeatherResult) -> Void in
//            print(WeatherResult)
//        }
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //位置情報取得の可否。バックグラウンドで実行中の場合にもアプリが位置情報を利用することを許可する
        locationManager.requestAlwaysAuthorization()
        //位置情報の精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //位置情報取得間隔(m)
        locationManager.distanceFilter = 300
        
        // 位置情報を取得
        locationManager.startUpdatingLocation()
    }

}

extension ViewController: CLLocationManagerDelegate {

    /** 位置情報取得成功時 */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            longitude = location.coordinate.longitude
            latitude = location.coordinate.latitude
            print(String(longitude))
            print(String(latitude))
        }
    }

    /** 位置情報取得失敗時 */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Error")
    }

}
