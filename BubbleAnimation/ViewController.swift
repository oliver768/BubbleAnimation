//
//  ViewController.swift
//  BubbleAnimation
//
//  Created by Ravindra Sonkar on 29/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var btnOutlet : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        interactiveTransition.attach(to: vc)
        self.present(vc, animated: true, completion: nil)
    }
}
