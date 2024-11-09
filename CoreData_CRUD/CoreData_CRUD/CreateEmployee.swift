//
//  CreateEmployee.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 09/11/24.
//

import UIKit

class CreateEmployee: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailIdLabel: UITextField!
    
    let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        var employee = Employee(id: UUID(), name: nameLabel.text, emailId: emailIdLabel.text, profilePic: profileImage.image?.pngData())

        employeeManager.createEmployee(employee: employee )
        dismiss(animated: true)
    }
    
}
