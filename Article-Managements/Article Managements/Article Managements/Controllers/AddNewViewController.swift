//
//  AddNewViewController.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/18/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var imagePicker : UIImagePickerController!
    var evenHandler: AddNewArticlePresenter!
    var homeTableView : HomeTableViewController!
    var imageURL : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        evenHandler = AddNewArticlePresenter()
        evenHandler.addNewArticleInterface = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func imagePickerButton(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thumnailImageView.image = image
        }
        
        let imageData = UIImageJPEGRepresentation(thumnailImageView.image!, 5)
        uploadImage(image: imageData!)
        print(imageURL)
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func savePressed(_ sender: AnyObject) {
        
        postData(title: "KA" , description: "KA", image: imageURL)
        reloadTable()
        _ = navigationController?.popViewController(animated: true)
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
extension AddNewViewController : AddNewArticleInterface {
    func postData(title: String, description: String, image: String) {
        evenHandler.postData(title: title, description: title, image: title)
    }
    func uploadImage(image: Data) {
        evenHandler.uploadImage(image: image)
    }
    func reloadTable() {
        DispatchQueue.main.async {
            
            self.homeTableView.tableView.reloadData()
            
        }

    }
    func returnImageUrl(imageURL: String) {
            self.imageURL = imageURL
        print(self.imageURL)
    }

}
