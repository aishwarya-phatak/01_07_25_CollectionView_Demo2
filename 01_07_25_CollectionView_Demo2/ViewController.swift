//
//  ViewController.swift
//  01_07_25_CollectionView_Demo2
//
//  Created by Vishal Jagtap on 22/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var studentCollectionView: UICollectionView!
    var studentCollectionViewCell : StudentCollectionViewCell?
    var reuseIdentifierForStudentCollectionViewCell : String = "StudentCollectionViewCell"
    
    //dummy array of Student Objects
    var students = [Student(studentId: 101, studentName: "Sejal", studentCity: "Nagpur"),
                    Student(studentId: 102, studentName: "Akshay", studentCity: "Pune"),
                    Student(studentId: 103, studentName: "Suchita", studentCity: "Bidar"),
                    Student(studentId: 104, studentName: "Het", studentCity:"Gujarat"),
                    Student(studentId: 105, studentName: "Faizan", studentCity: "Kolhapur"),
                    Student(studentId: 106, studentName: "Sujata", studentCity: "Pune"),
                    Student(studentId: 107, studentName: "Monali", studentCity: "Pune"),
                    Student(studentId: 108, studentName: "Ashvee", studentCity: "Pune"),
                    Student(studentId: 109, studentName: "Sukanya", studentCity: "Pune"),
                    Student(studentId: 110, studentName: "Sukanya", studentCity: "Pune"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        registerCellWithCollectionView()
    }
    
    func initializeViews(){
        studentCollectionView.dataSource = self
        studentCollectionView.delegate = self
    }
    
    func registerCellWithCollectionView(){
        let uiNIb = UINib(nibName: "StudentCollectionViewCell", bundle: nil)
        studentCollectionView.register(uiNIb, forCellWithReuseIdentifier: reuseIdentifierForStudentCollectionViewCell)
    }
}

//MARK : UICollectionViewDataSource protocol conforms to ViewController
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        studentCollectionViewCell = self.studentCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForStudentCollectionViewCell, for: indexPath) as? StudentCollectionViewCell
        studentCollectionViewCell?.studentProfileImageView.image = UIImage(named: "test_image_2")
        studentCollectionViewCell?.studentNameLabel.text = students[indexPath.item].studentName
        studentCollectionViewCell?.studentCityLabel.text = students[indexPath.item].studentCity
        return studentCollectionViewCell!
    }
}

//MARK : UICollectionViewDelegateFlowLayout protocol conforms to ViewController
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
