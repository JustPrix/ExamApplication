//
//  LoginViewController.swift
//  TestApplication
//
//  Created by COE-14 on 02/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    
    var dbObj:dbManager!
    var value = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dbObj = dbManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func swtchSecurePassword(_ sender: UISwitch) {
        txtFldPassword.isSecureTextEntry = !(txtFldPassword.isSecureTextEntry)
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if (txtFldUsername.text != "" && txtFldPassword.text != "") {
            let queryTxt = "SELECT * from User where username = \"\(txtFldUsername.text!)\" AND password = \"\(txtFldPassword.text!)\""
            //let testQuery = "SELECT * from User where username = \"Test\" AND password = \"test1\""
            
            let id = dbObj.ExecuteQuery(with: queryTxt)[0]
            //print(id.count)
            
            for key in id.keys {
                //print(id[key]!)
                self.value.append(id[key]!)
                //self.value.append(id[key]!)
            }
            //print(type(of: value[3]))
            //print(value)
            performSegue(withIdentifier: "PassData", sender: sender)
            /*
             let city = value[0] as! String
             let email = value[1] as! String
             let password = value[2] as! String
             let image = value[3] as! NSData
             let gender = value[4] as! String
             let userid = value[5] as! String
             let username = value[6] as! String
             
             value = [Any]()
             */
            //this is working now, finish the login
            
            //print(id.keys[id.keys.startIndex])
            //print(txtFldUsername.text!)
            //print(txtFldPassword.text!)
        }
        else{
            print("\n\n\t\tError!")
            let alert = UIAlertController.init(title: "Error", message: "Some mistake has occurred, please try again", preferredStyle: .alert)
            let continueAction = UIAlertAction.init(title: "Continue", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(continueAction)
            self.present(alert, animated: true, completion: nil)
        }
   
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ProfileViewController
        vc?.finalValue = value
    }
    @IBAction func btnRegister(_ sender: UIButton) {
        performSegue(withIdentifier: "RegisterView", sender: sender)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
