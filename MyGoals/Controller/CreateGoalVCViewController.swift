//
//  CreateGoalVCViewController.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 31/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

class CreateGoalVCViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermButtonOutlet: UIButton!
    @IBOutlet weak var shortTermButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    // this variable is set as default selected longterm
    var goalType :GoalType = .longTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call the function to move the button up with the keyboard
        nextButtonOutlet.adjustNextButto()
        
        // set default color for that call the function
        longTermButtonOutlet.selectedColour()
        shortTermButtonOutlet.deSelectedColour()
        goalTextView.delegate = self

       
    }

   
    @IBAction func goToGoalsVCButton(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func longTermButtonPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButtonOutlet.selectedColour()
        shortTermButtonOutlet.deSelectedColour()
        
    }
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButtonOutlet.selectedColour()
        longTermButtonOutlet.deSelectedColour()
        
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your nextGoal"{
           
            // the code block defines that what is happening whne we are pressing the next button
            guard let finishButtonWhenPressed = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else {return}
            finishButtonWhenPressed.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentHomeView(finishButtonWhenPressed)
        }
        
    }
    
    // function to delete the placeholeder when we start editing
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
