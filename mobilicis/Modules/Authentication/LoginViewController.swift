//
//  LoginViewController.swift
//  QuantumIT
//
//  Created by saeem  on 23/04/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var googlesigninButton: UIButton!
    @IBOutlet weak var appleSigninButton: UIButton!
    
    var stroyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButton.setTitle("Login", for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        appleSigninButton.setTitle("", for: .normal)
        googlesigninButton.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
     
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        self.navigationController?.pushViewController(vc, animated: true)
     
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
