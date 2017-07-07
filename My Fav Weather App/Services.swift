
import UIKit

class Services: NSObject {
    
    var degree: Double!
    var pressure: Double!
    var windDirection: String!
    var windSpeed: Double!
    var precipitationH: Double!
    
    var mod: Model!
    
    override init(){
        super.init()
        
        mod = Model()
        
    }
    
    public func makeRequest(request: URLRequest, completion: @escaping (String)->Void) {
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data, error == nil else{
                print(error ?? "Unkown error occured")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response ?? "No response")
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
                
                if let current = json["current"] as? [String : AnyObject] {
                    
                    if let temp = current["temp_c"] {
                        
                        print(temp)
                        
                        self.degree = temp as! Double
                        
                    }
                    
                    if let press = current["pressure_in"]{
                        
                        self.pressure = press as! Double
                        
                    }
                    
                    if let windD = current["wind_dir"]{
                        
                        self.windDirection = windD as! String
                        
                    }

                    if let windS = current["wind_kph"]{
                        
                        self.windSpeed = windS as! Double
                        
                    }
                    
                    if let precip = current["precip_mm"] {
                        
                        self.precipitationH = precip as! Double
                        
                    }
                    
                }
                
                
            } catch {
                
            }
            
            let responseString = String(data: data, encoding: .utf8) ?? ""
            completion(responseString)
        }
        task.resume()
    }
    
    
}
