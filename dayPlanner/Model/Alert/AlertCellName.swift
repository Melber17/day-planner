//
//  AlertCellName.swift
//  dayPlanner
//
//  Created by Evgeniy on 06/04/2022.
//

import UIKit

extension UIViewController {
    func alertcellName(label: UILabel, name: String, placeholder: String) {
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default) { (action) in
            let textFieldAlert = alert.textFields?.first
            guard let text = textFieldAlert?.text else { return }
            label.text = text
        }
        
        alert.addTextField { (textFieldAlert) in
            textFieldAlert.placeholder = placeholder
            
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
     
        present(alert, animated: true, completion: nil)
    }
}
