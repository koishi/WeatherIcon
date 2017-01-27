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
        setupLocationManager()
    }

    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 300
        locationManager.startUpdatingLocation()
    }

    fileprivate func updateIcon(coordinate: CLLocationCoordinate2D) {
        let weatherAPI = WAPIManager(apiKey: "9eeaea80076ac9f4b5f19ec445d707f3", temperatureFormat: .Celsius, lang: .English)
        weatherAPI.currentWeatherByCoordinatesAsJson(coordinates: coordinate) {
            (WeatherResult) -> Void in
            print(WeatherResult)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            updateIcon(coordinate: location.coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Error")
    }

}
