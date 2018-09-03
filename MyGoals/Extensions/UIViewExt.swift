//
//  UIViewExt.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 02/09/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

extension UIView{
    // the function that will bind the keyboard to slide up and down for the keyboard movement.
    // we will add and observer for that thing
    
    func adjustNextButto(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
       
    }
    
    @objc func keyBoardWillChange(_ notification: NSNotification){
        
        // these five property you need to animate so remember
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingframe = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let changeInPostion = endingframe.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y = self.frame.origin.y + changeInPostion
        }, completion: nil)
        
    }
    
    
}
