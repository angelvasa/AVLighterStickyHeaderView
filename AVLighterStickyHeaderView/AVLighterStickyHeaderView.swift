//
//  AVLighterStickyHeaderView.swift
//  AVLighterStickyHeaderView
//
//  Created by Angel Vasa on 13/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import UIKit
@IBDesignable
open class AVLighterStickyHeaderView: UIView {

    
    @IBInspectable
    var minimumHeight: CGFloat = 64
    typealias progressValueHandler = (CGFloat) -> ()
    
    @IBOutlet weak var scrollView: UIScrollView?
    var gProgressValue: progressValueHandler?
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        self.scrollView?.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        self.scrollView?.contentInset = UIEdgeInsetsMake((self.scrollView?.contentInset.top)!, 0, 0, 0)
        self.scrollView?.scrollIndicatorInsets = (self.scrollView?.contentInset)!;
    }
    
    
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        updateView(((change![.newKey] as AnyObject).cgPointValue)!)
    }
    
    
    var currentOffset: CGPoint?
    func updateView(_ offset: CGPoint) {
        currentOffset = offset
        if (currentOffset!.y > -minimumHeight){
            currentOffset = CGPoint(x: currentOffset!.x, y: -minimumHeight)
        }
        
        self.frame.origin.y = -currentOffset!.y-(self.scrollView?.contentInset.top)!
        
        let distance: CGFloat = (self.scrollView?.contentInset.top)! - minimumHeight
        let progressInverse: CGFloat = (currentOffset!.y + (self.scrollView?.contentInset.top)!) / distance
        let progress: CGFloat = 1 - progressInverse
        gProgressValue!(progress)
    }
    
    
    func getProgressValue(_ progressValue: @escaping progressValueHandler) {
        gProgressValue = progressValue
    }
    
    
    

}
