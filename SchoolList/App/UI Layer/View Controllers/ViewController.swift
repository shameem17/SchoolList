//
//  ViewController.swift
//  SchoolList
//
//  Created by Shameem on 18/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let schoolViewModel: SchoolViewModel = SchoolViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //viewModel call
        schoolViewModel.getSchools {[weak self] schools, error in
            if let error = error{
                let alert = UIAlertController(title: "Error",
                                              message: "Error in School Data",
                                              preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(alertAction)
                self?.present(alert, animated: true)
            }else{
                if let schools = schools{
                    print("Total School count = \(schools.count)")
                }
            }
        }
        
//        let api:SchoolDataApi = SchoolData()
//        api.getSchool { result in
//            switch result{
//            case .failure(let error):
//                print("Error = \(error)")
//            case .success(let schools):
//                if let schools = schools{
//                    print("Total \(schools.count) schools found")
//                }
//                
//            }
//        }
    }


}

