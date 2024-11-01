//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Mantosh Kumar on 31/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var savedValueinDatabaseLabel: UILabel!
    
    var allEmployeeList = [Employee]()
    var allEmployeeString = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createEmployee() {
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.name = "\(String(describing: nameTextField.text))"
        PersistentStorage.shared.saveContext()
    }
    
    func fetchEmployee() {
        
        do {
            guard let employees = try PersistentStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else { return }
            
            allEmployeeString = []
            
            for employee in employees  {
                allEmployeeList.append(employee)
                print(employee.name ?? "No Employee found")
                allEmployeeString.append(employee.name ?? "No value")
            }
            
            let arrayString = allEmployeeString.joined(separator: ",\n ")
            savedValueinDatabaseLabel.text = arrayString
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        
        if nameTextField.text != "" {
            createEmployee()
        } else {
            print(" Please enter some value to save ")
        }
    }
    
    @IBAction func readButtonAction(_ sender: Any) {
        fetchEmployee()
    }
    
}

