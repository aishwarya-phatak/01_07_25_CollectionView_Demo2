//
//  SecondViewController.swift
//  01_07_25_CollectionView_Demo2
//
//  Created by Vishal Jagtap on 25/08/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var studentNameLabel: UILabel!
    @IBOutlet var studentCityLabel: UILabel!
    
    var studentContainer : Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractStudentData()
    }
    
    private func extractStudentData(){
        self.studentNameLabel.text = self.studentContainer?.studentName
        
        self.studentCityLabel.text = self.studentContainer?.studentCity
    }
}
