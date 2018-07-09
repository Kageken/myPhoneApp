//
//  ViewController.swift
//  myPhoneApp
//
//  Created by 陰山賢太 on 2018/07/09.
//  Copyright © 2018年 Kageken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headarPrevButton: UIButton!
    @IBOutlet weak var headerNextButton: UIButton!
    @IBOutlet weak var headerTitle: UINavigationItem!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedHeaderPrevButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedHeaderNextButton(_ sender: UIButton) {
    }
    
}

