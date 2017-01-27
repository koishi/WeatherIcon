//
//  ViewController.swift
//  WeatherIcon
//
//  Created by 大石　弘一郎 on 2017/01/27.
//  Copyright © 2017年 大石　弘一郎. All rights reserved.
//

import UIKit
import SwiftOpenWeatherMapAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherAPI = WAPIManager(apiKey: "9eeaea80076ac9f4b5f19ec445d707f3", temperatureFormat: .Celsius, lang: .English)
        
        weatherAPI.currentWeatherByCityNameAsJson(cityName: "London") { (result) -> Void in
            print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

