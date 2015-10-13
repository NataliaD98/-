//
//  ViewController.swift
//  Weather
//
//  Created by Admin on 05.10.15.
//  Copyright © 2015 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var MaxTemp, MinTemp, Wind, Humidity: Double!
    var iconId: String!
    
    @IBOutlet var FindCityName: UITextField!
    @IBOutlet var FindCityNameButton: UIButton!
    @IBOutlet var Label1: UILabel!
    @IBOutlet var CityName: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet var Temperature: UILabel!
    @IBOutlet var MoreButton: UIButton!
    @IBOutlet var FewDaysButton: UIButton!
    
    
    @IBAction func FindCityNameButton(sender: AnyObject) {
         takeWeather("http://api.openweathermap.org/data/2.5/weather?q=" + FindCityName.text! + "&APPID=6d341ec7cf0c50365d6e5191331aa269")
        
         let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(FindCityName.text, forKey: "CityName")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let UploadCityName = defaults.stringForKey("CityName") {
            FindCityName.text = UploadCityName
            FindCityNameButton(FindCityNameButton)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takeWeather(urlString: String) {
        let url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){ (data, response, error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setInfo(data!)
            })
            
        }
        task.resume()
        
    }
    
    func setInfo(weatherData: NSData) {
        var jsonError: NSError?
        do {
        let json = try NSJSONSerialization.JSONObjectWithData(weatherData, options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        if let name = json["name"] as? String {
            CityName.text = name;
            CityName.hidden = false
            Label1.hidden = false
        }
        
        if let weather = json["weather"] as? NSArray {
            if let weatherN = weather[0] as? NSDictionary {
                if let icon = weatherN["icon"] as? String {
                    iconId = icon
                }
            }
        }
            
            
        if let main = json["main"] as? NSDictionary {
            if let temp = main["temp"] as? Double {
                Temperature.text = String(format: "%.1f", temp-273.15)
                Temperature.hidden = false
                Label2.hidden = false
                MoreButton.hidden = false
                FewDaysButton.hidden = false

                
                MaxTemp = (main["temp_max"] as? Double)! - 273.15
                MinTemp = (main["temp_min"] as? Double)! - 273.15
                Humidity = (main["humidity"] as? Double)!
                
            }
            
            if let windClass = json["wind"] as? NSDictionary {
                Wind = windClass["speed"] as? Double
            }
            
        }
            
        }catch let error as NSError {
            print(error)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showMoreView")
        {
            var upcoming: MoreWeatherView = segue.destinationViewController as! MoreWeatherView
            
            let CityNameToView = self.CityName.text
            
            upcoming.AddCityName = CityNameToView
            upcoming.AddMaxTemp = MaxTemp
            upcoming.AddMinTemp = MinTemp
            upcoming.AddTemp = Temperature.text
            upcoming.AddHumidity = Humidity
            upcoming.AddWind = Wind
            upcoming.AddIconId = iconId
            
        }
        
        if (segue.identifier == "Show5DaysWeather") {
            var upcoming: FewDaysWeather = segue.destinationViewController as! FewDaysWeather
            
            upcoming.AddCityName = self.CityName.text
        }
    }

}

