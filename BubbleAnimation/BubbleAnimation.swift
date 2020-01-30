//
//  BubbleAnimation.swift
//  BubbleAnimation
//
//  Created by Ravindra Sonkar on 30/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import Foundation
import UIKit


protocol BubbleAnimationProtocol  {
    var transition : BubbleTransition { get }
    var interactiveTransition : BubbleInteractiveTransition { get }
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    func bubble(_ viewController : UIViewController, animation : Bool, completion : (() -> Void)?)
    
}
extension BubbleAnimationProtocol {
    var transition : BubbleTransition {
        get { return BubbleTransition() }
    }
    
    var interactiveTransition : BubbleInteractiveTransition {
        get { return BubbleInteractiveTransition() }
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = CGPoint(x: 0, y: 0)
        transition.bubbleColor = .systemPink
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = CGPoint(x: 0, y: 0)
        transition.bubbleColor = .black
        return transition
    }
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
}

extension UIViewController {
    func bubblePresent(_ viewController: UIViewController, animation: Bool, completion: (() -> Void)?) {
        bubble(viewController, animation: animation, completion: completion)
    }
    
}

extension UIViewController : BubbleAnimationProtocol {
    func bubble(_ vc: UIViewController, animation: Bool, completion: (() -> Void)?) {
        vc.modalPresentationStyle = .custom
        interactiveTransition.attach(to: vc)
        self.present(vc, animated: true, completion: nil)
    }
}
