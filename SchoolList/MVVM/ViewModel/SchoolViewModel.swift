//
//  SchoolViewModel.swift
//  SchoolList
//
//  Created by Shameem on 21/1/24.
//

import Foundation

class SchoolViewModel{
    private(set) var schools: [School] = []
    private(set) var error: DataError? = nil
    
    private let apiService: SchoolDataApi = SchoolData()
    func getSchools(completion: @escaping(([School]?, DataError?) ->Void ) ){
        apiService.getSchool {[weak self] result in
            switch result{
            case .success(let schools):
                self?.schools = schools ?? []
                completion(schools, nil)
            case .failure(let error):
                self?.error = error
                completion([], error)
            }
        }
    }
}
