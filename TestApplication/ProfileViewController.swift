//
//  ProfileViewController.swift
//  TestApplication
//
//  Created by COE-14 on 02/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var sgmtGender: UISegmentedControl!
    
    var dbOj:dbManager!
    var finalValue = [Any]()
    let genderArray = ["Male","Female","Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dbOj = dbManager()
        
        txtFldUsername.text = finalValue[6] as? String
        txtFldCity.text = finalValue[0] as? String
        txtFldEmail.text = finalValue[1] as? String
        txtFldPassword.text = finalValue[2] as? String
        //print(genderArray.index(of: finalValue[4] as! String)!)
        //print(finalValue[4] as! String)
        sgmtGender.selectedSegmentIndex = genderArray.index(of: finalValue[4] as! String)!
        //print(finalValue[3])
        //let imgData = finalValue[3] as! Data
        //print(type(of: finalValue[3]))
        //let data = NSKeyedUnarchiver.unarchiveObject(with: finalValue[3] as! Data)
        
        let decodedData = Data(base64Encoded: finalValue[3] as! String, options: .ignoreUnknownCharacters)
        let decodedImage = UIImage(data: decodedData!)!
        
        imgUser.image = decodedImage
        print(finalValue[5])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnUpdateInformation(_ sender: Any) {
        /*
        //let updatetext = "Select userimage,username,email,password,city,gender from User"
        let imgData = UIImageJPEGRepresentation(imgUser.image!, 1.0)!
        let strBase64 = imgData.base64EncodedString(options: .lineLength64Characters)
        let updateText = "UPDATE Users SET username = '\(txtFldUsername.text!)', email = '\(txtFldEmail.text!)', password = '\(txtFldPassword.text!)', city = '\(txtFldCity.text!)', gender = '\(genderArray[sgmtGender.selectedSegmentIndex])', userimage = '\(strBase64)' WHERE userid = '\(finalValue[5])'"
        if(dbObj.ExecuteCommand(with: updateText))
        {
            print("\n\n\tExecuted!")
            let alert = UIAlertController.init(title: "Success", message: "You updated successfuly, you can now login with these details", preferredStyle: .alert)
            let continueAction = UIAlertAction.init(title: "Continue", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(continueAction)
            self.present(alert, animated: true, completion: nil)
            
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
        */
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
