//
//  SignupViewController.swift
//  Happiness Calculator
//
//  Created by saeem  on 23/04/23.
//

import UIKit

class SignupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var selectedAge: Int?
    var ageRange = Array(1...100)
    
    @IBOutlet weak var ageInput: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
        signinButton.setTitle("Sign in", for: .normal)
        signupButton.setTitle("Sign Up", for: .normal)
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ageInputTapped(_ sender: Any) {
        createPickerView()
    }
    // MARK: - Picker View Code
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageRange.count
    }
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> Int? {
        return ageRange[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedAge = ageRange[row]
        ageInput.text = "\(selectedAge ?? 0)"
        
    }

    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        ageInput.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        ageInput.inputAccessoryView = toolBar
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func action() {
        view.endEditing(true)
    }

}
