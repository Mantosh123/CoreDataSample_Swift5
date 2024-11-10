//
//  EmployeeDetailViewController.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 10/11/24.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var selectedEmployee: Employee? = nil
    
    var manager = EmployeeManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = UIImage(data: (selectedEmployee?.profilePic)!)
        nameTextField.text = selectedEmployee?.name
        emailTextField.text = selectedEmployee?.emailId
    }
    
    @IBAction func updateButtonactipon(_ sender: Any) {
        
        
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        
    }
    
    
}
