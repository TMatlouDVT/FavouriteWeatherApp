//
//  Model.swift
//  My Fav Weather App
//
//  Created by Garlic Technologies  on 2017/07/06.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//


import UIKit

class Model: NSObject {
    
    var degree: Double!
    var pressure: Double!
    var windDirection: String!
    var windSpeed: Double!
    var precipitationH: Double!
    
    
    override init(){
        super.init()
        
        
    }
    
    
    let regularButton: UIButton = {
        
        
        let rBtn = UIButton()
        rBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return rBtn
    }()
    
    
    
    let regularLabel: UILabel = {
        
        
        let rLbl = UILabel()
        rLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        return rLbl
        
    }()
    
    let regularView: UIView = {
        
        let rV = UIView()
        rV.translatesAutoresizingMaskIntoConstraints = false
        
        
        return rV
    }()
    
    
    let regularImageView: UIImageView = {
        
        let rIV = UIImageView()
        rIV.translatesAutoresizingMaskIntoConstraints = false
        
        return rIV
    }()
    
    
}
