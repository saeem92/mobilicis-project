//
//  SignupButton.swift
//  QuantumIT
//
//  Created by saeem  on 17/10/22.
//

import UIKit

class SignupButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor(red: 111/255, green: 160/255, blue: 250/255, alpha: 1).cgColor
        
        layer.cornerRadius = 20
    }
    
    

}
