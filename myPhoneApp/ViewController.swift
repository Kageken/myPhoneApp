//
//  ViewController.swift
//  myPhoneApp
//
//  Created by 陰山賢太 on 2018/07/09.
//  Copyright © 2018年 Kageken. All rights reserved.
//

import UIKit

extension UIColor{
    class func lightBlue() -> UIColor{
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    
    class func lightRed() -> UIColor{
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let datePerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = Date()
    var today: Date!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    @IBOutlet weak var headarPrevButton: UIButton!
    @IBOutlet weak var headerNextButton: UIButton!
    @IBOutlet weak var headerTitle: UINavigationItem!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else {
            return dateManager.daysAcquisition()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCell
        
        if ( indexPath.row % 7 == 0 ) {
            cell.textLabel.textColor = UIColor.lightRed()
        } else if ( indexPath.row % 7 == 6 ) {
            cell.textLabel.textColor = UIColor.lightBlue()
        } else {
            cell.textLabel.textColor = UIColor.gray
        }
        
        if ( indexPath.section == 0 ) {
            cell.textLabel.text = weekArray[indexPath.row]
        } else {
            cell.textLabel.text = dateManager.conversionDateFormat(indexPath)
        }
        
        return cell
    }

    @IBAction func tappedHeaderPrevButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedHeaderNextButton(_ sender: UIButton) {
    }
    
}

