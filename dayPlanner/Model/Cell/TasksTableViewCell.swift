//
//  TasksTableViewCell.swift
//  dayPlanner
//
//  Created by Evgeniy on 04/04/2022.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    
    let taskName = UILabel(text: "Go to shopping", font: .avenirNextDemiBold20())
    let taskDescription = UILabel(text: "Buy some closes", font: .avenirNext14())
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "circle.circle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var cellTaskDelegate: PressSubmitTaskButtonProtocol?
    var index: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [self] in
            setConstraints()
        }
        
        taskDescription.numberOfLines = 2

        self.selectionStyle = .none
        
        submitButton.addTarget(self, action: #selector(handlePressSubmit), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePressSubmit() {
        guard let index = index else { return }
        cellTaskDelegate?.handlePressSubmit(indexPath: index)
    }
    
    func setConstraints() {
        self.contentView.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            submitButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
            submitButton.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        self.addSubview(taskName)
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskName.trailingAnchor.constraint(equalTo: submitButton.leadingAnchor, constant: -5),
            taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskName.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        self.addSubview(taskDescription)
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            taskDescription.trailingAnchor.constraint(equalTo: submitButton.leadingAnchor, constant: -5),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
    }
}
