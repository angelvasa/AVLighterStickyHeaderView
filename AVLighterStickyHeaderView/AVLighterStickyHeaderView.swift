//
//  AVLighterStickyHeaderView.swift
//  AVLighterStickyHeaderView
//
//  Created by Angel Vasa on 13/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import UIKit
@IBDesignable
public class AVLighterStickyHeaderView: UIView {

    
    @IBInspectable
    var minimumHeight: CGFloat = 64
    typealias progressValueHandler = (CGFloat) -> ()
    
    @IBOutlet weak var scrollView: UIScrollView?
    var gProgressValue: progressValueHandler?
    
    override public func willMoveToSuperview(newSuperview: UIView?) {
        self.scrollView?.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
        self.scrollView?.contentInset = UIEdgeInsetsMake((self.scrollView?.contentInset.top)!, 0, 0, 0)
        self.scrollView?.scrollIndicatorInsets = (self.scrollView?.contentInset)!;
    }
    
    
    
    override public func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        updateView((change!["new"]?.CGPointValue)!)
    }
    
    
    var currentOffset: CGPoint?
    func updateView(offset: CGPoint) {
        currentOffset = offset
        if (currentOffset!.y > -minimumHeight){
            currentOffset = CGPointMake(currentOffset!.x, -minimumHeight)
        }
        
        self.frame.origin.y = -currentOffset!.y-(self.scrollView?.contentInset.top)!
        
        let distance: CGFloat = (self.scrollView?.contentInset.top)! - minimumHeight
        let progressInverse: CGFloat = (currentOffset!.y + (self.scrollView?.contentInset.top)!) / distance
        let progress: CGFloat = 1 - progressInverse
        gProgressValue!(progress)
    }
    
    
    func getProgressValue(progressValue: progressValueHandler) {
        gProgressValue = progressValue
    }
    
    
    

}
