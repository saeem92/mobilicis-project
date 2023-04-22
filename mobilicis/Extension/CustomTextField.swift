//
//  CustomTextField.swift
//  QuantumIT
//
//  Created by saeem  on 17/10/22.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 250/255, alpha: 1).cgColor
        
        layer.cornerRadius = 20
    }
}
