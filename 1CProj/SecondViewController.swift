//
//  SecondViewController.swift
//  1CProj
//
//  Created by Денис Дубовиков on 15.04.2020.
//  Copyright © 2020 Денис Дубовиков. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {


    var addressTextField: UITextField!
    var nameTextField: UITextField!
    var addButton: UIButton!
    var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupTextFields()
        setupAddButton()
        setupMainLabel()
        
        view.addSubview(addressTextField)
        view.addSubview(nameTextField)
        view.addSubview(addButton)
        view.addSubview(mainLabel)

        // Do any additional setup after loading the view.
    }
    
    func setupTextFields() {
        addressTextField = UITextField(frame: CGRect(x: view.frame.size.width / 10, y: view.frame.size.height / 2 - 40, width: view.frame.size.width * 0.8, height: 20))
        nameTextField = UITextField(frame: CGRect(x: view.frame.size.width / 10, y: view.frame.size.height / 2 - 10, width: view.frame.size.width * 0.8, height: 20))
        
        addressTextField.placeholder = "Web address"
        nameTextField.placeholder = "Name"
    }
    
    func setupAddButton() {
        addButton = UIButton(frame: CGRect(x: view.frame.size.width / 2 - 20, y: view.frame.size.height / 2 + 50, width: 40, height: 40))
        addButton.backgroundColor = .black
        addButton.setTitle("Add!", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    func setupMainLabel() {
        mainLabel = UILabel(frame: CGRect(x: view.frame.size.width / 2 - 50, y: 150, width: 150, height: 50))
        mainLabel.text = "Add One"
        mainLabel.font = UIFont(name: "Helvetica Neue", size: 28)
        mainLabel.textColor = .black
        mainLabel.backgroundColor = .clear
    }
    
    
    @objc func addButtonPressed() {
        sitesMng.addSite(address_: addressTextField.text!, name_: nameTextField.text!)
        
        self.view.endEditing(true)
        addressTextField.text = ""
        nameTextField.text = ""
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
