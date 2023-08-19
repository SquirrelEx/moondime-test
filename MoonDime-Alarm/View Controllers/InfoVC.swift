//
//  InfoVC.swift
//  LocationAlarm
//
//  Created by Gaurav Bidalia
//  Copyright © 2022 Gaurav Bidalia. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appNameLabel.text = "📍Location Alarm v" + version
        }
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
