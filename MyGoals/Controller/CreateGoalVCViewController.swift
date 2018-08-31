//
//  CreateGoalVCViewController.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 31/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

class CreateGoalVCViewController: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermButtonOutlet: UIButton!
    @IBOutlet weak var shortTermButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   
    @IBAction func goToGoalsVCButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func longTermButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
    }
    
}
