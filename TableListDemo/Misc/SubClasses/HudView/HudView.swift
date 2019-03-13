//
//  HudView.swift
//  TableListDemo
//
//  Created by Darshan on 13/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class HudView: UIView {
    
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()
    
    static var hudView : HudView?
    
    class func show() {
        DispatchQueue.main.async {
            self.remove()
            hudView = HudView(frame: UIScreen.main.bounds)
            hudView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            hudView?.isOpaque = true

            self.setUpIndicator()
            self.showHud()
            UIApplication.currentViewController()?.view.addSubview(hudView!)
        }
    }
    
    // MARK: Private
    private class func setUpIndicator() {
        hudView?.indicator.style = .gray
        hudView?.indicator.center = (hudView?.center)!
        hudView?.addSubview((hudView?.indicator)!)
    }
    
    private class func showHud(){
        hudView?.indicator.startAnimating()
    }
    
    private class func remove(){
        if hudView != nil {
            hudView!.indicator.stopAnimating()
            hudView!.removeFromSuperview()
            hudView = nil
        }
    }
    
    class func kill(){
        DispatchQueue.main.async {
            if hudView != nil {
                UIView.animate(withDuration: 0.1, animations: {
                    hudView!.backgroundColor = .clear
                }, completion: { (isFinished : Bool) in
                    self.remove()
                })
            }
        }
    }
}

