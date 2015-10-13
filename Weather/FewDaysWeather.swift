//
//  FewDaysWeather.swift
//  Weather
//
//  Created by Admin on 11.10.15.
//  Copyright © 2015 Admin. All rights reserved.
//

import UIKit

class FewDaysWeather: UIViewController {
    
    var AddCityName: String!
    var ShowMaxTemp, ShowMinTemp: Double!
    
    @IBOutlet var Date1Label: UILabel!
    @IBOutlet var Date2Label: UILabel!
    @IBOutlet var Date3Label: UILabel!
    @IBOutlet var Date4Label: UILabel!
    @IBOutlet var Date5Label: UILabel!
    
    @IBOutlet var Img1: UIImageView!
    @IBOutlet var Img2: UIImageView!
    @IBOutlet var Img3: UIImageView!
    @IBOutlet var Img4: UIImageView!
    @IBOutlet var Img5: UIImageView!
    
    @IBOutlet var Temp1Label: UILabel!
    @IBOutlet var Temp2Label: UILabel!
    @IBOutlet var Temp3Label: UILabel!
    @IBOutlet var Temp4Label: UILabel!
    @IBOutlet var Temp5Label: UILabel!
    
    @IBOutlet var Wind1Label: UILabel!
    @IBOutlet var Wind2Label: UILabel!
    @IBOutlet var Wind3Label: UILabel!
    @IBOutlet var Wind4Label: UILabel!
    @IBOutlet var Wind5Label: UILabel!
    
    @IBOutlet var Humidity1Label: UILabel!
    @IBOutlet var Humidity2Label: UILabel!
    @IBOutlet var Humidity3Label: UILabel!
    @IBOutlet var Humidity4Label: UILabel!
    @IBOutlet var Humidity5Label: UILabel!
    
    @IBOutlet var TempImg1: UIImageView!
    @IBOutlet var TempImg2: UIImageView!
    @IBOutlet var TempImg3: UIImageView!
    @IBOutlet var TempImg4: UIImageView!
    @IBOutlet var TempImg5: UIImageView!
    
    
    
    @IBOutlet var CityNameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        takeWeather("http://api.openweathermap.org/data/2.5/forecast?q=" + AddCityName + "&model&APPID=6d341ec7cf0c50365d6e5191331aa269")
        
        CityNameLabel.text = AddCityName
        
        let defaults = NSUserDefaults.standardUserDefaults()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            
            if let list = json["list"] as? NSArray {
        ////11111111111111
                if let listIndex = list[0] as? NSDictionary {
                    
                    if let date = listIndex["dt_txt"] as? String {
                        Date1Label.text = date
                    }
                    
                    if let main = listIndex["main"] as? NSDictionary {
                        if let MinTemp = main["temp_min"] as? Double {
                            ShowMinTemp = MinTemp - 273.15
                        }
                        
                        if let MaxTemp = main["temp_max"] as? Double {
                            ShowMaxTemp = MaxTemp - 273.15
                        }
                        
                        if ShowMaxTemp < -35 {
                            TempImg1.image = UIImage(named: "1.png")
                        }
                        else if (ShowMaxTemp >= -35) &&  (ShowMaxTemp < -25) {
                            TempImg1.image = UIImage(named: "2.png")
                        }
                        else if (ShowMaxTemp >= -25) &&  (ShowMaxTemp < -15) {
                            TempImg1.image = UIImage(named: "3.png")
                        }
                        else if (ShowMaxTemp >= -15) &&  (ShowMaxTemp < -5) {
                            TempImg1.image = UIImage(named: "4.png")
                        }
                        else if (ShowMaxTemp >= -5) &&  (ShowMaxTemp < 5) {
                            TempImg1.image = UIImage(named: "1-5.png")
                        }
                        else if (ShowMaxTemp >= 5) &&  (ShowMaxTemp < 15) {
                            TempImg1.image = UIImage(named: "1-4.png")
                        }
                        else if (ShowMaxTemp >= 15) &&  (ShowMaxTemp < 25) {
                            TempImg1.image = UIImage(named: "1-3.png")
                        }
                        else if (ShowMaxTemp >= 25) &&  (ShowMaxTemp < 35) {
                            TempImg1.image = UIImage(named: "1-2.png")
                        }
                        else if (ShowMaxTemp >= 35) {
                            TempImg1.image = UIImage(named: "1-1.png")
                        }
                        
                        if let humidity = main["humidity"] as? Double{
                            Humidity1Label.text = String(format: "%.0f", humidity) + "%"
                        }

                    Temp1Label.text = String(format: "%.1f", ShowMinTemp) + "°C..." + String(format: "%.1f", ShowMaxTemp) + "°C"
                    }
                    
                    
                    if let weather = listIndex["weather"] as? NSArray {
                        if let weatherIndex = weather[0] as? NSDictionary {
                            if let icon = weatherIndex["icon"] as? String {
                                Img1.image = UIImage(named: icon)
                            }
                        }
                    }
                    
                    if let wind = listIndex["wind"] as? NSDictionary {
                        if let speed = wind["speed"] as? Double {
                            Wind1Label.text = String(format: "%.1f", speed) + "м/с"
                        }
                    }
                }
                
                
 //22222222222222
                
                if let listIndex = list[8] as? NSDictionary {
                    
                    if let date = listIndex["dt_txt"] as? String {
                        Date2Label.text = date
                    }
                    
                    if let main = listIndex["main"] as? NSDictionary {
                        if let MinTemp = main["temp_min"] as? Double {
                            ShowMinTemp = MinTemp - 273.15
                        }
                        
                        if let MaxTemp = main["temp_max"] as? Double {
                            ShowMaxTemp = MaxTemp - 273.15
                        }
                        
                        if ShowMaxTemp < -35 {
                            TempImg2.image = UIImage(named: "1.png")
                        }
                        else if (ShowMaxTemp >= -35) &&  (ShowMaxTemp < -25) {
                            TempImg2.image = UIImage(named: "2.png")
                        }
                        else if (ShowMaxTemp >= -25) &&  (ShowMaxTemp < -15) {
                            TempImg2.image = UIImage(named: "3.png")
                        }
                        else if (ShowMaxTemp >= -15) &&  (ShowMaxTemp < -5) {
                            TempImg2.image = UIImage(named: "4.png")
                        }
                        else if (ShowMaxTemp >= -5) &&  (ShowMaxTemp < 5) {
                            TempImg2.image = UIImage(named: "1-5.png")
                        }
                        else if (ShowMaxTemp >= 5) &&  (ShowMaxTemp < 15) {
                            TempImg2.image = UIImage(named: "1-4.png")
                        }
                        else if (ShowMaxTemp >= 15) &&  (ShowMaxTemp < 25) {
                            TempImg2.image = UIImage(named: "1-3.png")
                        }
                        else if (ShowMaxTemp >= 25) &&  (ShowMaxTemp < 35) {
                            TempImg2.image = UIImage(named: "1-2.png")
                        }
                        else if (ShowMaxTemp >= 35) {
                            TempImg2.image = UIImage(named: "1-1.png")
                        }
                        
                        if let humidity = main["humidity"] as? Double{
                            Humidity2Label.text = String(format: "%.0f", humidity) + "%"
                        }
                        
                        Temp2Label.text = String(format: "%.1f", ShowMinTemp) + "°C..." + String(format: "%.1f", ShowMaxTemp) + "°C"
                    }
                    
                    
                    if let weather = listIndex["weather"] as? NSArray {
                        if let weatherIndex = weather[0] as? NSDictionary {
                            if let icon = weatherIndex["icon"] as? String {
                                Img2.image = UIImage(named: icon)
                            }
                        }
                    }
                    
                    if let wind = listIndex["wind"] as? NSDictionary {
                        if let speed = wind["speed"] as? Double {
                            Wind2Label.text = String(format: "%.1f", speed) + "м/с"
                        }
                    }
                }

 ///333333333333333333
                
                if let listIndex = list[16] as? NSDictionary {
                    
                    if let date = listIndex["dt_txt"] as? String {
                        Date3Label.text = date
                    }
                    
                    if let main = listIndex["main"] as? NSDictionary {
                        if let MinTemp = main["temp_min"] as? Double {
                            ShowMinTemp = MinTemp - 273.15
                        }
                        
                        if let MaxTemp = main["temp_max"] as? Double {
                            ShowMaxTemp = MaxTemp - 273.15
                        }
                        
                        if ShowMaxTemp < -35 {
                            TempImg3.image = UIImage(named: "1.png")
                        }
                        else if (ShowMaxTemp >= -35) &&  (ShowMaxTemp < -25) {
                            TempImg3.image = UIImage(named: "2.png")
                        }
                        else if (ShowMaxTemp >= -25) &&  (ShowMaxTemp < -15) {
                            TempImg3.image = UIImage(named: "3.png")
                        }
                        else if (ShowMaxTemp >= -15) &&  (ShowMaxTemp < -5) {
                            TempImg3.image = UIImage(named: "4.png")
                        }
                        else if (ShowMaxTemp >= -5) &&  (ShowMaxTemp < 5) {
                            TempImg3.image = UIImage(named: "1-5.png")
                        }
                        else if (ShowMaxTemp >= 5) &&  (ShowMaxTemp < 15) {
                            TempImg3.image = UIImage(named: "1-4.png")
                        }
                        else if (ShowMaxTemp >= 15) &&  (ShowMaxTemp < 25) {
                            TempImg3.image = UIImage(named: "1-3.png")
                        }
                        else if (ShowMaxTemp >= 25) &&  (ShowMaxTemp < 35) {
                            TempImg3.image = UIImage(named: "1-2.png")
                        }
                        else if (ShowMaxTemp >= 35) {
                            TempImg3.image = UIImage(named: "1-1.png")
                        }
                        
                        if let humidity = main["humidity"] as? Double{
                            Humidity3Label.text = String(format: "%.0f", humidity) + "%"
                        }
                        
                        Temp3Label.text = String(format: "%.1f", ShowMinTemp) + "°C..." + String(format: "%.1f", ShowMaxTemp) + "°C"
                    }
                    
                    
                    if let weather = listIndex["weather"] as? NSArray {
                        if let weatherIndex = weather[0] as? NSDictionary {
                            if let icon = weatherIndex["icon"] as? String {
                                Img3.image = UIImage(named: icon)
                            }
                        }
                    }
                    
                    if let wind = listIndex["wind"] as? NSDictionary {
                        if let speed = wind["speed"] as? Double {
                            Wind3Label.text = String(format: "%.1f", speed) + "м/с"
                        }
                    }
                }
                
/////444444444444444444
                
                
                if let listIndex = list[24] as? NSDictionary {
                    
                    if let date = listIndex["dt_txt"] as? String {
                        Date4Label.text = date
                    }
                    
                    if let main = listIndex["main"] as? NSDictionary {
                        if let MinTemp = main["temp_min"] as? Double {
                            ShowMinTemp = MinTemp - 273.15
                        }
                        
                        if let MaxTemp = main["temp_max"] as? Double {
                            ShowMaxTemp = MaxTemp - 273.15
                        }
                        
                        if ShowMaxTemp < -35 {
                            TempImg4.image = UIImage(named: "1.png")
                        }
                        else if (ShowMaxTemp >= -35) &&  (ShowMaxTemp < -25) {
                            TempImg4.image = UIImage(named: "2.png")
                        }
                        else if (ShowMaxTemp >= -25) &&  (ShowMaxTemp < -15) {
                            TempImg4.image = UIImage(named: "3.png")
                        }
                        else if (ShowMaxTemp >= -15) &&  (ShowMaxTemp < -5) {
                            TempImg4.image = UIImage(named: "4.png")
                        }
                        else if (ShowMaxTemp >= -5) &&  (ShowMaxTemp < 5) {
                            TempImg4.image = UIImage(named: "1-5.png")
                        }
                        else if (ShowMaxTemp >= 5) &&  (ShowMaxTemp < 15) {
                            TempImg4.image = UIImage(named: "1-4.png")
                        }
                        else if (ShowMaxTemp >= 15) &&  (ShowMaxTemp < 25) {
                            TempImg4.image = UIImage(named: "1-3.png")
                        }
                        else if (ShowMaxTemp >= 25) &&  (ShowMaxTemp < 35) {
                            TempImg4.image = UIImage(named: "1-2.png")
                        }
                        else if (ShowMaxTemp >= 35) {
                            TempImg4.image = UIImage(named: "1-1.png")
                        }
                        
                        if let humidity = main["humidity"] as? Double{
                            Humidity4Label.text = String(format: "%.0f", humidity) + "%"
                        }
                        
                        Temp4Label.text = String(format: "%.1f", ShowMinTemp) + "°C..." + String(format: "%.1f", ShowMaxTemp) + "°C"
                    }
                    
                    
                    if let weather = listIndex["weather"] as? NSArray {
                        if let weatherIndex = weather[0] as? NSDictionary {
                            if let icon = weatherIndex["icon"] as? String {
                                Img4.image = UIImage(named: icon)
                            }
                        }
                    }
                    
                    if let wind = listIndex["wind"] as? NSDictionary {
                        if let speed = wind["speed"] as? Double {
                            Wind4Label.text = String(format: "%.1f", speed) + "м/с"
                        }
                    }
                }

//////55555555555
                
                if let listIndex = list[32] as? NSDictionary {
                    
                    if let date = listIndex["dt_txt"] as? String {
                        Date5Label.text = date
                    }
                    
                    if let main = listIndex["main"] as? NSDictionary {
                        if let MinTemp = main["temp_min"] as? Double {
                            ShowMinTemp = MinTemp - 273.15
                        }
                        
                        if let MaxTemp = main["temp_max"] as? Double {
                            ShowMaxTemp = MaxTemp - 273.15
                        }
                        
                        if ShowMaxTemp < -35 {
                            TempImg5.image = UIImage(named: "1.png")
                        }
                        else if (ShowMaxTemp >= -35) &&  (ShowMaxTemp < -25) {
                            TempImg5.image = UIImage(named: "2.png")
                        }
                        else if (ShowMaxTemp >= -25) &&  (ShowMaxTemp < -15) {
                            TempImg5.image = UIImage(named: "3.png")
                        }
                        else if (ShowMaxTemp >= -15) &&  (ShowMaxTemp < -5) {
                            TempImg5.image = UIImage(named: "4.png")
                        }
                        else if (ShowMaxTemp >= -5) &&  (ShowMaxTemp < 5) {
                            TempImg5.image = UIImage(named: "1-5.png")
                        }
                        else if (ShowMaxTemp >= 5) &&  (ShowMaxTemp < 15) {
                            TempImg5.image = UIImage(named: "1-4.png")
                        }
                        else if (ShowMaxTemp >= 15) &&  (ShowMaxTemp < 25) {
                            TempImg5.image = UIImage(named: "1-3.png")
                        }
                        else if (ShowMaxTemp >= 25) &&  (ShowMaxTemp < 35) {
                            TempImg5.image = UIImage(named: "1-2.png")
                        }
                        else if (ShowMaxTemp >= 35) {
                            TempImg5.image = UIImage(named: "1-1.png")
                        }
                        
                        if let humidity = main["humidity"] as? Double{
                            Humidity5Label.text = String(format: "%.0f", humidity) + "%"
                        }
                        
                        Temp5Label.text = String(format: "%.1f", ShowMinTemp) + "°C..." + String(format: "%.1f", ShowMaxTemp) + "°C"
                    }
                    
                    
                    if let weather = listIndex["weather"] as? NSArray {
                        if let weatherIndex = weather[0] as? NSDictionary {
                            if let icon = weatherIndex["icon"] as? String {
                                Img5.image = UIImage(named: icon)
                            }
                        }
                    }
                    
                    if let wind = listIndex["wind"] as? NSDictionary {
                        if let speed = wind["speed"] as? Double {
                            Wind5Label.text = String(format: "%.1f", speed) + "м/с"
                        }
                    }
                }
   
                
                
            }
            
            
        }catch let error as NSError {
            print(error)
        }
    }

    
    
}

