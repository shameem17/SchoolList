//
//  School.swift
//  SchoolList
//
//  Created by Shameem on 18/1/24.
//

import Foundation


struct School: Codable{
    let dbn: String
    let schoolName: String?
    let schoolEmail: String?
    let phoneNumber: String?
    let location: String?
    let city: String?
    let zip: String?
    let overView: String?
    let schoolSports: String?
    let latitude: String?
    let longitude: String?
    let stateCode: String?
    let website: String?
    
    
    enum CodingKeys: String, CodingKey{
        
        case dbn
        case schoolName = "school_name"
        case schoolEmail = "school_email"
        case phoneNumber = "phone_number"
        case overView = "overview_paragraph"
        case location
        case schoolSports = "school_sports"
        case city
        case zip
        case latitude
        case longitude
        case stateCode = "state_code"
        case website
    }
    
}
