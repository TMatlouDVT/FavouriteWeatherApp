

import UIKit

import CoreLocation
import MapKit
class ViewController: UIViewController {
    
    var services: Services!
    var station: Station!
    
    var accText = UITextField()
    
    let viewByMyLocation: UIButton = {
        
        let bV = UIButton()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = .clear
        let image = UIImage(named: "findNow")?.withRenderingMode(.alwaysTemplate)
        bV.setImage(image, for: UIControlState.normal)
        bV.tintColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        bV.addTarget(self, action: #selector(openByLocation), for: .touchUpInside)
        
        return bV
    }()
    
    let searchCityName: UIButton = {
        
        let bV = UIButton()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = .clear
        let image = UIImage(named: "searching")?.withRenderingMode(.alwaysTemplate)
        bV.setImage(image, for: UIControlState.normal)
        bV.tintColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        bV.addTarget(self, action: #selector(openBySearch), for: .touchUpInside)
        
        return bV
    }()
    
    let openFavorites: UIButton = {
        
        let bV = UIButton()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = .clear
        let image = UIImage(named: "star-1")?.withRenderingMode(.alwaysTemplate)
        bV.setImage(image, for: UIControlState.normal)
        bV.tintColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        bV.addTarget(self, action: #selector(openFavourites), for: .touchUpInside)
        
        
        return bV
    }()
    
    let openInfo: UIButton = {
        
        let bV = UIButton()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = .clear
        let image = UIImage(named: "cloudquestion")?.withRenderingMode(.alwaysTemplate)
        bV.setImage(image, for: UIControlState.normal)
        bV.tintColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        bV.addTarget(self, action: #selector(openInfoV), for: .touchUpInside)
        
        return bV
    }()
    
    
    let driverLine: UIView = {
        
        let bV = UIView()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        
        return bV
    }()
    
    let falconLine: UIView = {
        
        let bV = UIView()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        
        return bV
    }()
    
    let shutdownLine: UIView = {
        
        let bV = UIView()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        
        return bV
    }()
    
    let locLine: UIView = {
        
        let bV = UIView()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = UIColor.init(red: 0/255, green: 191/255, blue: 255/255, alpha: 1)
        
        return bV
    }()
    
    
    
    let bottomV: UIView = {
        
        let bV = UIView()
        bV.translatesAutoresizingMaskIntoConstraints = false
        bV.backgroundColor = .clear
        
        return bV
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
    
    let settings: UIButton = {
        
        let sett = UIButton()
        sett.translatesAutoresizingMaskIntoConstraints = false
        let settie = UIImage(named: "settings")?.withRenderingMode(.alwaysTemplate)
        sett.setImage(settie, for: UIControlState.normal)
        sett.tintColor = .white
        sett.backgroundColor = .black
        sett.addTarget(self, action: #selector(openSettingsV), for: .touchUpInside)
        
        return sett
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        popUp()
        services = Services()
        station = Station()
    }
    
    func setup(){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        UIImage(named: "The Strain")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        navigationItem.title = "HOME"
        
        view.addSubview(viewByMyLocation)
        view.addSubview(searchCityName)
        view.addSubview(openFavorites)
        view.addSubview(openInfo)
        view.addSubview(driverLine)
        view.addSubview(falconLine)
        view.addSubview(shutdownLine)
        view.addSubview(locLine)
        
        
        
        view.addSubview(bottomV)
        bottomV.addSubview(home)
        bottomV.addSubview(settings)
        
        viewByMyLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85).isActive = true
        viewByMyLocation.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -85).isActive = true
        viewByMyLocation.widthAnchor.constraint(equalToConstant: 160).isActive = true
        viewByMyLocation.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        driverLine.topAnchor.constraint(equalTo: viewByMyLocation.bottomAnchor).isActive = true
        driverLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        driverLine.leftAnchor.constraint(equalTo: viewByMyLocation.leftAnchor).isActive = true
        driverLine.rightAnchor.constraint(equalTo: viewByMyLocation.rightAnchor, constant: -5).isActive = true
        
        searchCityName.leftAnchor.constraint(equalTo: viewByMyLocation.rightAnchor).isActive = true
        searchCityName.widthAnchor.constraint(equalToConstant: 160).isActive = true
        searchCityName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -85).isActive = true
        searchCityName.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        falconLine.leftAnchor.constraint(equalTo: viewByMyLocation.rightAnchor).isActive = true
        falconLine.widthAnchor.constraint(equalToConstant: 2).isActive = true
        falconLine.topAnchor.constraint(equalTo: viewByMyLocation.topAnchor).isActive = true
        falconLine.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        
        openFavorites.topAnchor.constraint(equalTo: viewByMyLocation.bottomAnchor).isActive = true
        openFavorites.heightAnchor.constraint(equalToConstant: 160).isActive = true
        openFavorites.widthAnchor.constraint(equalToConstant: 160).isActive = true
        openFavorites.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85).isActive = true
        
        shutdownLine.leftAnchor.constraint(equalTo: openFavorites.rightAnchor).isActive = true
        shutdownLine.widthAnchor.constraint(equalToConstant: 2).isActive = true
        shutdownLine.topAnchor.constraint(equalTo: openFavorites.topAnchor, constant: 5).isActive = true
        shutdownLine.bottomAnchor.constraint(equalTo: openFavorites.bottomAnchor).isActive = true
        
        
        openInfo.leftAnchor.constraint(equalTo: openFavorites.rightAnchor).isActive = true
        openInfo.widthAnchor.constraint(equalToConstant: 160).isActive = true
        openInfo.topAnchor.constraint(equalTo: searchCityName.bottomAnchor).isActive = true
        openInfo.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        locLine.topAnchor.constraint(equalTo: searchCityName.bottomAnchor).isActive = true
        locLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        locLine.widthAnchor.constraint(equalToConstant: 155).isActive = true
        locLine.rightAnchor.constraint(equalTo: searchCityName.rightAnchor).isActive = true
        
        bottomV.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomV.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomV.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        home.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        home.topAnchor.constraint(equalTo: bottomV.topAnchor, constant: 2).isActive = true
        home.bottomAnchor.constraint(equalTo: bottomV.bottomAnchor).isActive = true
        home.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        settings.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        settings.topAnchor.constraint(equalTo: bottomV.topAnchor, constant: 2).isActive = true
        settings.bottomAnchor.constraint(equalTo: bottomV.bottomAnchor).isActive = true
        settings.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }
    
    func popUp(){
    
    
        let alert = UIAlertController(title: "Hi there!", message: "Welcome to your favourite weather app, simply search by your location or city of interest. Enjoy!", preferredStyle: .alert)
        
        
        
        alert.addAction(UIAlertAction(title: "Will do!", style: .default, handler: nil))
        
        
            
        self.present(alert, animated: true, completion: nil)
    
    }
    
    func goHome(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func openByLocation(){
        
        
        
        
        let byLocation = ViewByLocationController()
        
        
        
        present(byLocation, animated: true, completion: nil)
        
    }
    
    
    
    func openBySearch(){
        
        
        let alert = UIAlertController(title: "City Name:", message: "Please enter the name of the city you want to get weather info from.", preferredStyle: .alert)
    
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: self.okHandler))
        alert.addTextField(configurationHandler: accTextH)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func accTextH(textField: UITextField!){
        
        accText = textField
        accText.placeholder = "City Name"
        
    }
    
    func okHandler(alert: UIAlertAction!){
        
        print("Ok pressed")
        
        if accText.text != nil {
        
            let urlToRequest = "http://api.apixu.com/v1/current.json?key=a69f6734b2d24b8e85f125353172006&q=\(accText.text!)"
           
            let url = URL(string: urlToRequest)!
        
            let request = NSMutableURLRequest(url: url)
        
            services.makeRequest(request: request as URLRequest) {response in
            
                DispatchQueue.main.async{
                
                    let st = Station()
                    
                    st.getCityName(city: self.accText.text!)
                    
                    self.present(st, animated: true, completion: nil)
                
                    self.station.tempLabel.text = "\(self.services.degree.description)° C"
                    self.station.pressure.text = "\(self.services.pressure.description) "
                    self.station.precipitation.text = "\(self.services.precipitationH.description) %"
        
                }
            }

        }
        
    }
    
    func openFavourites(){
    
        let favs = FavouritesTableViewController()
        
        navigationController?.pushViewController(favs, animated: true)
    
    }
    
    func openSettingsV(){
    
        let sett = SettingsViewController()
        
        present(sett, animated: true, completion: nil)
    
    }
    
    func openInfoV(){
    
    
        let info = InfoViewController()
        
        present(info, animated: true, completion: nil)
    
    }
    
}

