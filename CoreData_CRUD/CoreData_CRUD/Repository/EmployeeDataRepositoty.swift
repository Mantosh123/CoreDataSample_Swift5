//
//  EmployeeDataRepositoty.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 02/11/24.
//

import Foundation
import CoreData

protocol EmployeeRepositoty {
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(employee: Employee) -> Bool
}

struct EmployeeDataRepositoty: EmployeeRepositoty {
    func getAll() -> [Employee]? {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employees: [Employee] = []
        
        result?.forEach({ cdEmployee in
            employees.append(cdEmployee.convertToEmployee())
        })
        return employees
    }
    
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.email = employee.emailId
        cdEmployee.name = employee.name
        cdEmployee.profilePic = employee.profilePic
        cdEmployee.id = employee.id
        
        PersistentStorage.shared.saveContext()
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(byIdentifire: id)
        guard result != nil else { return nil}
        return result?.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        //
        let result = getCDEmployee(byIdentifire: employee.id)
        guard result != nil else { return false}
        
        result?.name = employee.name
        result?.email = employee.emailId
        result?.profilePic = employee.profilePic
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(employee: Employee) -> Bool {
        
        let cdEmployee = getCDEmployee(byIdentifire: employee.id)
        guard cdEmployee != nil else { return false}
 
        PersistentStorage.shared.context.delete(cdEmployee!)
        return true
    }
    
    private func getCDEmployee(byIdentifire id : UUID) -> CDEmployee? {
        
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else { return nil }
            return result
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
