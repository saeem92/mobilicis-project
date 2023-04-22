//
//  SplashVC.swift
//  mobilicis
//
//  Created by saeem  on 23/04/23.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func getyourdeviceinfo(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
