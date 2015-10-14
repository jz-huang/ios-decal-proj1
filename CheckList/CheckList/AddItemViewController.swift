//
//  AddItemViewController.swift
//  CheckList
//
//  Created by Jackson Huang on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var save: UIBarButtonItem!
    
    var task: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        textbox.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textbox.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender === save {
            task = textbox.text ?? ""
        }
    }
    

}
