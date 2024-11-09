//
//  CreateNewEmployee.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 09/11/24.
//

import UIKit

class CreateNewEmployee: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var profilePicImage: UIImageView!
    @IBOutlet weak var nameTextFile: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        profilePicImage.image = image
        
        dismiss(animated: true)
        
    }
    
    @IBAction func imageGalory(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let employee = Employee(id: UUID(),name: nameTextFile.text, emailId: emailTextField.text, profilePic: profilePicImage.image?.pngData())
        
        employeeManager.createEmployee(employee: employee)
        
        navigationController?.popViewController(animated: true)
        
    }
    


}
