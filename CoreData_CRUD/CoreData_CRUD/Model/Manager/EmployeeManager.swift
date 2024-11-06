//
//  EmployeeManager.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 06/11/24.
//

import Foundation
import CoreData

struct EmployeeManager {
    
    private let employeeDataRepository = EmployeeDataRepositoty()
    
    func createEmployee(employee: Employee) {
        employeeDataRepository.create(employee: employee)
    }
    
    func fetchEmployee() -> [Employee]? {
        return employeeDataRepository.getAll()
    }
    
    func updateEmployee(employee: Employee) -> Bool {
        return employeeDataRepository.update(employee: employee)
    }
    
    func deleteEmployee(employee: Employee) -> Bool {
        return employeeDataRepository.delete(employee: employee)
    }
    
}
