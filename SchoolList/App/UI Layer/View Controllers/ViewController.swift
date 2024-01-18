//
//  ViewController.swift
//  SchoolList
//
//  Created by Shameem on 18/1/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let api:SchoolDataApi = SchoolData()
        api.getSchool()
    }


}

