//
//  RegisterViewController.swift
//  TestApplication
//
//  Created by COE-14 on 02/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var sgmtGender: UISegmentedControl!
    
    
    
    var dbObj:dbManager!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dbObj = dbManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swtchSecurePassword(_ sender: Any) {
        txtFldPassword.isSecureTextEntry = !(txtFldPassword.isSecureTextEntry)
    }
    
    var imgPicker:UIImagePickerController!
    @IBAction func PickImageOnTapAction(_ sender: UITapGestureRecognizer) {
        
        imgPicker = UIImagePickerController()
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        //self.navigationController?.pushViewController(imgPicker, animated: true)
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage!
        imgUser.image = img
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnRegister(_ sender: Any) {
        let genderArray = ["Male","Female","Other"]
        let imgData = UIImageJPEGRepresentation(imgUser.image!, 1.0)!
        let strBase64 = imgData.base64EncodedString(options: .lineLength64Characters)
        //print(type(of: imgData))
        let cmdText = "Insert into User(userimage,username,email,password,city,gender) values('\(strBase64)','\(txtFldUsername.text!)','\(txtFldEmail.text!)','\(txtFldPassword.text!)','\(txtFldCity.text!)','\(genderArray[sgmtGender.selectedSegmentIndex])')"
        
        print(genderArray[sgmtGender.selectedSegmentIndex])
        print(sgmtGender.selectedSegmentIndex)
        
        if(dbObj.ExecuteCommand(with: cmdText))
        {
            print("\n\n\tExecuted!")
            let alert = UIAlertController.init(title: "Success", message: "You registered successfuly, you can now login with these details", preferredStyle: .alert)
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
