//
//  RootDisplayCollectionViewController.swift
//  TestApplication
//
//  Created by COE-14 on 02/01/20.
//  Copyright © 2020 COE-14. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
var dbObj:dbManager!
let queryT = "SELECT * FROM User"
let selectedUsers = dbObj.ExecuteQuery(with: queryT)

class RootDisplayCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        dbObj = dbManager()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return selectedUsers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RootCollectionViewCell
    
        // Configure the cell
        let user = selectedUsers[indexPath.item]
        var value = [Any]()
        
        for key in user.keys {
            //print(id[key]!)
            value.append(user[key]!)
            //self.value.append(id[key]!)
        }
        cell.lblName.text = value[6] as? String
        let decodedData = Data(base64Encoded: value[3] as! String, options: .ignoreUnknownCharacters)
        let decodedImage = UIImage(data: decodedData!)!
        cell.imgUser.image = decodedImage
    
        return cell
    }

    @IBAction func barBtnLogOut(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure?", preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Stay Here", style: .default, handler: nil)
        let continueAlert = UIAlertAction(title: "Log Out", style: .destructive) { (alert) in
            self.performSegue(withIdentifier: "logOut", sender: sender)
        }
        alert.addAction(cancelAlert)
        alert.addAction(continueAlert)
        self.present(alert, animated: true, completion: nil)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
