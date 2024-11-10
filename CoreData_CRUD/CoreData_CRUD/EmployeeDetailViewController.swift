//
//  EmployeeDetailViewController.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 10/11/24.
//

import UIKit

class EmployeeDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    let picker = UIImagePickerController()

    var selectedEmployee: Employee? = nil
    var manager = EmployeeManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = UIImage(data: (selectedEmployee?.profilePic)!)
        nameTextField.text = selectedEmployee?.name
        emailTextField.text = selectedEmployee?.emailId
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        profilePic.image = image
        
        dismiss(animated: true)
        
    }
    
    @IBAction func updateButtonactipon(_ sender: Any) {
        
        let employee = Employee(id: selectedEmployee!.id, name: nameTextField.text, emailId: emailTextField.text, profilePic: profilePic.image?.pngData())
        let updatestatus = manager.updateEmployee(employee: employee)
        
        if updatestatus {
            navigationController?.popViewController(animated: true)
        } else {
            print("Something went wrong")
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        
        if manager.deleteEmployee(employee: selectedEmployee!) {
            navigationController?.popViewController(animated: true)
        } else {
            print("Something went wrong")
        }
    }
    
    @IBAction func profileImageEditAction(_ sender: Any) {
        
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }
    
}
