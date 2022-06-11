//
//  Color.swift
//  ProyectoFinal
//
//  Created by Francisco Javier Casais on 19/5/22.
//

import Foundation
import UIKit

extension UIColor {
    //rgb(104, 103, 172)
    @nonobjc class var DarkBlueGray : UIColor {
        return UIColor(red: 104.0/255.0, green: 103.0/255.0, blue: 172.0/255, alpha: 1.0)
    }
    //162, 103, 172)
    @nonobjc class var PurpleMountainMajesty : UIColor {
        return UIColor(red: 162.0/255.0, green: 103.0/255.0, blue: 172.0/255, alpha: 1.0)
    }
    
    @nonobjc class var SkyMagenta: UIColor {
        return UIColor(red: 206.0/255.0, green: 123.0/255.0, blue: 176.0/255, alpha: 1.0)
    }
    
    @nonobjc class var SkyMagentaDark : UIColor {
        return UIColor(red: 164.0/255.0, green: 98.0/255.0, blue: 140.0/255, alpha: 1.0)
    }
    
    @nonobjc class var BubbleGum : UIColor {
        return UIColor(red: 255.0/255.0, green: 188.0/255.0, blue: 209.0/255, alpha: 1.0)
    }
    
    //Found app
    @nonobjc class var foundApp : UIColor {
        return UIColor(red: 178.0/255.0, green: 150.0/255.0, blue: 181.0/255, alpha: 1.0)
    }
    
    //Blancos
    @nonobjc class var White50 : UIColor {
        return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.6)
    }
    
    //Error
    @nonobjc class var redError : UIColor {
        return UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
    //PlaceHolder
    @nonobjc class var BubbleGumSure : UIColor {
        return UIColor(red: 204.0/255.0, green: 150.0/255.0, blue: 218.0/255.0, alpha: 1.0)
    }
}
