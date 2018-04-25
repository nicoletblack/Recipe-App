//
//  IngredientsAndMethods.swift
//  FoodTracker
//
//  Created by Nicole Black on 4/23/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit
import os.log

class IngredientsMethodsController: UIViewController {
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var methodsTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInIngredientsMethodsMode = presentingViewController is UINavigationController
        
        if isPresentingInIngredientsMethodsMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The IngredientsMethodsController is not inside a navigation controller.")
        }
    }
    @IBAction func save(_ sender: Any) {
    }
    
    func textFieldDidEndEditing(_ textView: UITextView) {
        updateSaveButtonState()
        navigationItem.title = textView.text
    }
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let ingredients = ingredientsTextView.text ?? ""
        let methods = methodsTextView.text ?? ""
        saveButton.isEnabled = !ingredients.isEmpty
        saveButton.isEnabled = !methods.isEmpty
        
    }

}

