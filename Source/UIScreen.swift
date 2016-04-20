//
//  UIScreen.swift
//  AVLighterStickyHeaderView
//
//  Created by Angel Vasa on 15/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import UIKit


extension UIScreen {
    class var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    class var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
}