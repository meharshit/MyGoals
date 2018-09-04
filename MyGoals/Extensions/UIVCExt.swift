//
//  UIVCExt.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 31/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func presentDetail(_ presentTheViewController: UIViewController){
        
        let animation = CATransition()
        animation.type = kCATransitionPush
        animation.duration = 0.3
        animation.subtype = kCATransitionFromRight
        self.view.window?.layer.add(animation, forKey: kCATransition)
        
        
        present(presentTheViewController, animated: false, completion: nil)// animated is faulse since we have over written the animation above so false
    }
    
    
    func presentHomeView(_ viewControllerToPresent: UIViewController){
        let animation = CATransition()
        animation.type = kCATransitionPush
        animation.duration = 0.3
        animation.subtype = kCATransitionFromRight
    
        guard let viewController = presentedViewController else{return}
        
        viewController.dismiss(animated: false) {
            self.view.window?.layer.add(animation, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail(){
        
        let animation = CATransition()
        animation.type = kCATransitionPush
        animation.duration = 0.3
        animation.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(animation, forKey: kCATransition)

        dismiss(animated: false, completion: nil)
    }
    
    
}



