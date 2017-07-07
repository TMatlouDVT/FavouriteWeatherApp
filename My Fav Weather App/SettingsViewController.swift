//
//  SettingsViewController.swift
//  My Fav Weather App
//
//  Created by Garlic Technologies  on 2017/07/07.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {

    var autoLoc: [String] = []
    var autoFav: [String] = []
    
    var all: [AutoDetect] = []
    
    let auto: UILabel = {
    
        let aut = UILabel()
        aut.translatesAutoresizingMaskIntoConstraints = false
        aut.textColor = .white
        aut.text = "Auto detect location:"
        
        return aut
    }()
    
    let autoSwitch: UISwitch = {
    
        let autS = UISwitch()
        autS.translatesAutoresizingMaskIntoConstraints = false
        //autS.addTarget(self, action: #selector(callLocSwitch(_:)), for: .touchUpInside)
 
        return autS
    }()
    
    let divider: UIView = {
    
        let dvd = UIView()
        dvd.translatesAutoresizingMaskIntoConstraints = false
        dvd.backgroundColor = .white
        return dvd
        
    }()
    
    let autoF: UILabel = {
        
        let aut = UILabel()
        aut.translatesAutoresizingMaskIntoConstraints = false
        aut.textColor = .white
        aut.text = "Auto add location to favourites:"
        
        return aut
    }()
    
    let autoFSwitch: UISwitch = {
        
        let autS = UISwitch()
        autS.translatesAutoresizingMaskIntoConstraints = false
        //autS.addTarget(self, action: #selector(callFavSwitch(_:)), for: .touchUpInside)
        
        return autS
    }()
    
    let dividerLine: UIView = {
        
        let dvd = UIView()
        dvd.translatesAutoresizingMaskIntoConstraints = false
        dvd.backgroundColor = .white
        
        return dvd
        
    }()
    
    let home: UIButton = {
        
        let hme = UIButton()
        hme.translatesAutoresizingMaskIntoConstraints = false
        let homie = UIImage(named: "home2")?.withRenderingMode(.alwaysTemplate)
        hme.setImage(homie, for: UIControlState.normal)
        hme.tintColor = .white
        hme.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        hme.backgroundColor = .clear
        
        return hme
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
  
    }
    
    func setup(){
    
    
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        UIImage(named: "Passion")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        view.addSubview(home)
        view.addSubview(auto)
        view.addSubview(autoSwitch)
        view.addSubview(divider)
        view.addSubview(autoF)
        view.addSubview(autoFSwitch)
        view.addSubview(dividerLine)
        
        home.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        home.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        home.heightAnchor.constraint(equalToConstant: 45).isActive = true
        home.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        auto.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        auto.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        auto.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        auto.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        autoSwitch.leftAnchor.constraint(equalTo: auto.rightAnchor).isActive = true
        autoSwitch.widthAnchor.constraint(equalToConstant: 55).isActive = true
        autoSwitch.heightAnchor.constraint(equalToConstant: 45).isActive = true
        autoSwitch.topAnchor.constraint(equalTo: auto.topAnchor, constant: 5).isActive = true
        
        divider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        divider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
        divider.topAnchor.constraint(equalTo: auto.bottomAnchor).isActive = true
        
        autoF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        autoF.topAnchor.constraint(equalTo: auto.bottomAnchor, constant: 35).isActive = true
        autoF.widthAnchor.constraint(equalToConstant: view.frame.width / 2 + 85).isActive = true
        autoF.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        autoFSwitch.leftAnchor.constraint(equalTo: autoF.rightAnchor).isActive = true
        autoFSwitch.widthAnchor.constraint(equalToConstant: 55).isActive = true
        autoFSwitch.heightAnchor.constraint(equalToConstant: 45).isActive = true
        autoFSwitch.topAnchor.constraint(equalTo: autoF.topAnchor, constant: 5).isActive = true
        
        dividerLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        dividerLine.topAnchor.constraint(equalTo: autoF.bottomAnchor).isActive = true
        
        autoSwitch.isOn = true
        autoFSwitch.isOn = true
    
    }
    
    func goHome(){
    
    
        self.dismiss(animated: true, completion: nil)
    
    }
    

    
    
}
