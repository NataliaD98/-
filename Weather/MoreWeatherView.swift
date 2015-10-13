//
//  MoreWeatherView.swift
//  Weather
//
//  Created by Admin on 09.10.15.
//  Copyright © 2015 Admin. All rights reserved.
//

import UIKit

class MoreWeatherView: UIViewController {

    @IBOutlet var MaxTempImg: UIImageView!
    @IBOutlet var TempImg: UIImageView!
    @IBOutlet var MinTempImg: UIImageView!
    @IBOutlet var SentCityName: UILabel!
    @IBOutlet var BackGround: UIImageView!
    @IBOutlet var MaxTempLabel: UILabel!
    @IBOutlet var TempLabel: UILabel!
    @IBOutlet var MinTempLabel: UILabel!
    @IBOutlet var WindLabel: UILabel!
    @IBOutlet var WindImg: UIImageView!
    @IBOutlet var HumidityImg: UIImageView!
    @IBOutlet var HumidityLabel: UILabel!
    @IBOutlet var Icon: UIImageView!
    
    var AddCityName: String!
    var AddMinTemp, AddMaxTemp, AddWind, AddHumidity: Double!
    var AddTemp, AddIconId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SentCityName.text = AddCityName
        
        MaxTempLabel.text = String(format: "%.1f", AddMaxTemp)
        Icon.image = UIImage(named: AddIconId)
        
        
        if AddMaxTemp < -35 {
            MaxTempImg.image = UIImage(named: "1.png")
        }
        else if (AddMaxTemp >= -35) &&  (AddMaxTemp < -25) {
            MaxTempImg.image = UIImage(named: "2.png")
        }
        else if (AddMaxTemp >= -25) &&  (AddMaxTemp < -15) {
            MaxTempImg.image = UIImage(named: "3.png")
        }
        else if (AddMaxTemp >= -15) &&  (AddMaxTemp < -5) {
            MaxTempImg.image = UIImage(named: "4.png")
        }
        else if (AddMaxTemp >= -5) &&  (AddMaxTemp < 5) {
            MaxTempImg.image = UIImage(named: "1-5.png")
        }
        else if (AddMaxTemp >= 5) &&  (AddMaxTemp < 15) {
            MaxTempImg.image = UIImage(named: "1-4.png")
        }
        else if (AddMaxTemp >= 15) &&  (AddMaxTemp < 25) {
            MaxTempImg.image = UIImage(named: "1-3.png")
        }
        else if (AddMaxTemp >= 25) &&  (AddMaxTemp < 35) {
            MaxTempImg.image = UIImage(named: "1-2.png")
        }
        else if (AddMaxTemp >= 35) {
            MaxTempImg.image = UIImage(named: "1-1.png")
        }

        
        
        MinTempLabel.text = String(format: "%.1f", AddMinTemp)
        
        if AddMinTemp < -35 {
            MinTempImg.image = UIImage(named: "1.png")
        }
        else if (AddMinTemp >= -35) &&  (AddMinTemp < -25) {
            MinTempImg.image = UIImage(named: "2.png")
        }
        else if (AddMinTemp >= -25) &&  (AddMinTemp < -15) {
            MinTempImg.image = UIImage(named: "3.png")
        }
        else if (AddMinTemp >= -15) &&  (AddMinTemp < -5) {
            MinTempImg.image = UIImage(named: "4.png")
        }
        else if (AddMinTemp >= -5) &&  (AddMinTemp < 5) {
            MinTempImg.image = UIImage(named: "1-5.png")
        }
        else if (AddMinTemp >= 5) &&  (AddMinTemp < 15) {
            MinTempImg.image = UIImage(named: "1-4.png")
        }
        else if (AddMinTemp >= 15) &&  (AddMinTemp < 25) {
            MinTempImg.image = UIImage(named: "1-3.png")
        }
        else if (AddMinTemp >= 25) &&  (AddMinTemp < 35) {
            MinTempImg.image = UIImage(named: "1-2.png")
        }
        else if (AddMinTemp >= 35) {
            MinTempImg.image = UIImage(named: "1-1.png")
        }
        
        TempLabel.text = AddTemp
        
        let AddTempInt = Float(AddTemp)
        
        if AddTempInt < -35 {
            TempImg.image = UIImage(named: "1.png")
        }
        else if (AddTempInt >= -35) &&  (AddTempInt < -25) {
            TempImg.image = UIImage(named: "2.png")
        }
        else if (AddTempInt >= -25) &&  (AddTempInt < -15) {
            TempImg.image = UIImage(named: "3.png")
        }
        else if (AddTempInt >= -15) &&  (AddTempInt < -5) {
            TempImg.image = UIImage(named: "4.png")
        }
        else if (AddTempInt >= -5) &&  (AddTempInt < 5) {
            TempImg.image = UIImage(named: "1-5.png")
        }
        else if (AddTempInt >= 5) &&  (AddTempInt < 15) {
            TempImg.image = UIImage(named: "1-4.png")
        }
        else if (AddTempInt >= 15) &&  (AddTempInt < 25) {
            TempImg.image = UIImage(named: "1-3.png")
        }
        else if (AddTempInt >= 25) &&  (AddTempInt < 35) {
            TempImg.image = UIImage(named: "1-2.png")
        }
        else if (AddTempInt >= 35) {
            TempImg.image = UIImage(named: "1-1.png")
        }

        
        WindLabel.text = String(format: "%.1f", AddWind) + " м/с"
        
        HumidityLabel.text = String(format: "%.0f", AddHumidity) + "%"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
