//
//  Station.swift
//  My Fav Weather App
//
//  Created by Garlic Technologies  on 2017/07/06.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit

class Station: UIViewController {

    var servcices: Services!
    
    var passedCityName: String!
    
    public func getCityName(city name: String){
    
        passedCityName = name
    
    }
    
    var favs: [Favorites] = []
    
    let cityName: UILabel = {
        
        let cnm = UILabel()
        cnm.translatesAutoresizingMaskIntoConstraints = false
        cnm.textAlignment = NSTextAlignment.center
        cnm.textColor = .white
        cnm.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        
        return cnm
    }()
    
    let line: UIView = {
        
        let ln = UIView()
        ln.backgroundColor = .white
        ln.translatesAutoresizingMaskIntoConstraints = false
        
        return ln
    }()
    
    let tempLabel: UILabel = {
        
        let tL = UILabel()
        tL.translatesAutoresizingMaskIntoConstraints = false
        tL.textAlignment = NSTextAlignment.center
        tL.textColor = .white
        tL.text = "25"
        tL.font = UIFont(name:"HelveticaNeue-Bold", size: 60.0)
        
        return tL
    }()
    
    let moreTemp: UIView = {
        
        let mT = UIView()
        mT.translatesAutoresizingMaskIntoConstraints = false
        mT.backgroundColor = .white
        mT.layer.cornerRadius = 8
        
        return mT
    }()
    
    let pressureL: UILabel = {
        
        let prs = UILabel()
        prs.translatesAutoresizingMaskIntoConstraints = false
        prs.textColor = .black
        prs.text = "Pressure:"
        prs.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        prs.textAlignment = NSTextAlignment.center
        
        return prs
    }()
    
    let precipitationL: UILabel = {
        
        let prs = UILabel()
        prs.translatesAutoresizingMaskIntoConstraints = false
        prs.textColor = .black
        prs.text = "Precipitation:"
        prs.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        prs.textAlignment = NSTextAlignment.center
        
        return prs
        
    }()
    
    
    let pressure: UILabel = {
        
        let prs = UILabel()
        prs.translatesAutoresizingMaskIntoConstraints = false
        prs.textColor = .black
        prs.textAlignment = NSTextAlignment.center
        prs.text = "17 lbs"
        prs.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
        
        return prs
    }()
    
    let press: UIImageView = {
        
        let rain = UIImageView()
        rain.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "realpressure")?.withRenderingMode(.alwaysTemplate)
        rain.image = image
        rain.tintColor = .black
        
        return rain
    }()
    
    
    let precipitation: UILabel = {
        
        let prs = UILabel()
        prs.translatesAutoresizingMaskIntoConstraints = false
        prs.textColor = .black
        prs.textAlignment = NSTextAlignment.center
        prs.text = "21 %"
        prs.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
        
        return prs
        
    }()
    
    let rainy: UIImageView = {
        
        let rain = UIImageView()
        rain.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "realrain")?.withRenderingMode(.alwaysTemplate)
        rain.image = image
        rain.tintColor = .black
        
        return rain
    }()
    
    let bottomLine: UIView = {
        
        let bL = UIView()
        bL.translatesAutoresizingMaskIntoConstraints = false
        bL.backgroundColor = .clear
        
        return bL
    }()
    
    let home: UIButton = {
        
        let hme = UIButton()
        hme.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        hme.setImage(image, for: UIControlState.normal)
        hme.tintColor = .red
        hme.addTarget(self, action: #selector(openHome), for: .touchUpInside)
        
        return hme
        
    }()
    
    let fav: UIButton = {
        
        let fv = UIButton()
        fv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
        fv.setImage(image, for: UIControlState.normal)
        fv.tintColor = .red
        fv.addTarget(self, action: #selector(addToFavs), for: .touchUpInside)
        
        return fv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        servcices = Services()
        callServices()
    }
    
    var heightConstraint: NSLayoutConstraint?
    
    func setup(){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        UIImage(named: "Shrimpy")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        view.addSubview(cityName)
        view.addSubview(line)
        view.addSubview(tempLabel)
        view.addSubview(moreTemp)
        
        moreTemp.addSubview(pressureL)
        moreTemp.addSubview(precipitationL)
        moreTemp.addSubview(pressure)
        moreTemp.addSubview(press)
        moreTemp.addSubview(precipitation)
        moreTemp.addSubview(rainy)
        moreTemp.addSubview(bottomLine)
        moreTemp.addSubview(home)
        moreTemp.addSubview(fav)
        
        cityName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityName.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        cityName.heightAnchor.constraint(equalToConstant: 55).isActive = true
        cityName.widthAnchor.constraint(equalToConstant: 275).isActive = true
        
        cityName.text = passedCityName
        
        line.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        line.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 2).isActive = true
        line.topAnchor.constraint(equalTo: cityName.bottomAnchor).isActive = true
        
        tempLabel.topAnchor.constraint(equalTo: line.bottomAnchor).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tempLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 375).isActive = true
        
        moreTemp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        moreTemp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        moreTemp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
        
        heightConstraint = moreTemp.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 295)
        heightConstraint?.isActive = true
        
        animate()
        
        pressureL.topAnchor.constraint(equalTo: moreTemp.topAnchor).isActive = true
        pressureL.leftAnchor.constraint(equalTo: moreTemp.leftAnchor).isActive = true
        pressureL.heightAnchor.constraint(equalToConstant: 35).isActive = true
        pressureL.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 10).isActive = true
        
        precipitationL.topAnchor.constraint(equalTo: moreTemp.topAnchor).isActive = true
        precipitationL.rightAnchor.constraint(equalTo: moreTemp.rightAnchor).isActive = true
        precipitationL.heightAnchor.constraint(equalToConstant: 35).isActive = true
        precipitationL.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 10).isActive = true
        
        pressure.topAnchor.constraint(equalTo: pressureL.bottomAnchor).isActive = true
        pressure.leftAnchor.constraint(equalTo: moreTemp.leftAnchor).isActive = true
        pressure.heightAnchor.constraint(equalToConstant: 45).isActive = true
        pressure.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 10).isActive = true
        
        press.centerXAnchor.constraint(equalTo: pressure.centerXAnchor).isActive = true
        press.topAnchor.constraint(equalTo: pressure.bottomAnchor).isActive = true
        press.bottomAnchor.constraint(equalTo: bottomLine.topAnchor).isActive = true
        press.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        precipitation.topAnchor.constraint(equalTo: precipitationL.bottomAnchor).isActive = true
        precipitation.rightAnchor.constraint(equalTo: moreTemp.rightAnchor).isActive = true
        precipitation.heightAnchor.constraint(equalToConstant: 45).isActive = true
        precipitation.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 10).isActive = true
        
        rainy.centerXAnchor.constraint(equalTo: precipitation.centerXAnchor).isActive = true
        rainy.topAnchor.constraint(equalTo: precipitation.bottomAnchor).isActive = true
        rainy.bottomAnchor.constraint(equalTo: bottomLine.topAnchor).isActive = true
        rainy.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        bottomLine.leftAnchor.constraint(equalTo: moreTemp.leftAnchor).isActive = true
        bottomLine.rightAnchor.constraint(equalTo: moreTemp.rightAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomLine.bottomAnchor.constraint(equalTo: moreTemp.bottomAnchor, constant: -45).isActive = true
        
        home.leftAnchor.constraint(equalTo: moreTemp.leftAnchor).isActive = true
        home.widthAnchor.constraint(equalToConstant: 55).isActive = true
        home.topAnchor.constraint(equalTo: bottomLine.bottomAnchor).isActive = true
        home.bottomAnchor.constraint(equalTo: moreTemp.bottomAnchor, constant: -5).isActive = true
        
        fav.centerXAnchor.constraint(equalTo: moreTemp.centerXAnchor).isActive = true
        fav.widthAnchor.constraint(equalToConstant: 55).isActive = true
        fav.topAnchor.constraint(equalTo: bottomLine.bottomAnchor).isActive = true
        fav.bottomAnchor.constraint(equalTo: moreTemp.bottomAnchor, constant: -5).isActive = true
        
    }
    
    func animate(){
        
        heightConstraint?.isActive = false
        heightConstraint?.constant = 0
        heightConstraint?.isActive = true
        
        UIView.animate(withDuration: 1.0) {
            
            self.view.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 2.0) {
            
            self.pressure.textColor = .black
            self.precipitation.textColor = .black
            self.bottomLine.backgroundColor = .gray
            
        }
        
    }
    
    func openHome(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    var isThere = false
    
    func addToFavs(){
    
        getData()
        
        if favs != [] {
            
            let cnt = favs.count
           
            for i in 0 ..< cnt {
            
              if (favs[i].cityNames?.contains(cityName.text!))!{
                
                let alert = UIAlertController(title: "!!!", message: "City already added to favourites!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                present(alert, animated: true, completion: nil)
                
                isThere = true
                
                }
            }
            
            if isThere == false {
                
                saveItem(item: cityName.text!)
                
                let alert = UIAlertController(title: "Success!", message: "City successfuly added to favourites!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }else {
            
            saveItem(item: cityName.text!)
            
            let alert = UIAlertController(title: "Success!", message: "City successfuly added to favourites!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func callServices(){
        
        let urlToRequest = "http://api.apixu.com/v1/current.json?key=a69f6734b2d24b8e85f125353172006&q=\(cityName.text!)"
        let url = URL(string: urlToRequest)!
        
        let request = NSMutableURLRequest(url: url)
        servcices.makeRequest(request: request as URLRequest) {response in
            
            DispatchQueue.main.async{
                
                self.tempLabel.text = "\(self.servcices.degree.description)° C"
                self.pressure.text = "\(self.servcices.pressure.description)"
                //self.windDir.text = "Wind direction: \(self.services.windDirection.description)"
                //self.windSpee.text = "Wind speed: \(self.services.windSpeed.description) km/h"
                self.precipitation.text = "\(self.servcices.precipitationH.description) %"
                
            }
        }
        
    }
    
    func getData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            
            favs = try context.fetch(Favorites.fetchRequest())
            print(favs)
            print("We went through get data")
            
        }catch {
            
            print("Fetching failed")
            
        }
        
    }
    
    func saveItem(item: String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let favs = Favorites(context: context)
        
        favs.cityNames = item
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
}
