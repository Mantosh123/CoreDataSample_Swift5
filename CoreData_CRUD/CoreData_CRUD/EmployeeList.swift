//
//  EmployeeList.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 09/11/24.
//

import UIKit

class EmployeeList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var employeeList = EmployeeManager()
    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create Employee"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        employees = employeeList.fetchEmployee() ?? []
        print(employees)
        
        tableView.reloadData()
    }
    
    @IBAction func createEmployee(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewCtr = storyboard.instantiateViewController(identifier: "CreateNewEmployee")
        navigationController?.pushViewController(ViewCtr, animated: true)
    }
}

extension EmployeeList: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        cell.updateCell(employee: employees[indexPath.row])
        return cell;
    }
    
}
    
