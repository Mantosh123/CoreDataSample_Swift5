//
//  EmployeeTableViewCell.swift
//  CoreData_CRUD
//
//  Created by Mantosh Kumar on 09/11/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var profilleImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(employee: Employee) {
        nameLabel.text = employee.name
        emailIdLabel.text = employee.emailId
        profilleImage.image = employee.profilePic.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
