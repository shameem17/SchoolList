//
//  SchoolDataApi.swift
//  SchoolList
//
//  Created by Shameem on 18/1/24.
//

import Foundation
import Alamofire

protocol SchoolDataApi{
    func getSchool()
}
struct Constant{
    static let schoolDataUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$$app_token=L1KwLSwm1yz1N7aWqFCF4dLmM"
}

//school class conforms to schoolDataApi protocol
class SchoolData: SchoolDataApi{
    func getSchool() {
        print(Constant.schoolDataUrl)
        print("Implement func")
        alamofireSchoolData()
       // schoolUsingAppleStandard()
    }
    
    //Alamofire
    private func alamofireSchoolData(){
        AF.request(Constant.schoolDataUrl)
            .validate().responseDecodable(of: [School].self) { response in
                switch response.result{
                case .failure(let error):
                    break
                case .success(let schools):
                    print("Get the schools")
                    break
                }
            }
    }
    
    //apple standard
    private func schoolUsingAppleStandard(){
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "data.cityofnewyork.us"
        urlComponents.path = "/resource/s3k6-pzi2.json"
        urlComponents.queryItems = [URLQueryItem(name: "$$app_token", value: "L1KwLSwm1yz1N7aWqFCF4dLmM")]
        
        //let url = urlComponents.url
        //another way
        //url = URL(string: Constant.schoolDataUrl)
        
        if let url = urlComponents.url{
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                guard error == nil else{
                    print("error = \(error?.localizedDescription)")
                    return
                }
                
                if let data = data{
                    let decoder = JSONDecoder()
                    do{
                      let schools = try decoder.decode([School].self, from: data)
                        print("NY School = \(schools)")
                    }catch let error{
                        print("Parsing error \(error)")
                    }
                    
                }
            }
            task.resume()
        }
    }
}
