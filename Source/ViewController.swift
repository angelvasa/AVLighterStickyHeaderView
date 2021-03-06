//
//  ViewController.swift
//  AVLighterStickyHeaderView
//
//  Created by Angel Vasa on 13/04/16.
//  Copyright © 2016 Angel Vasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView?
    @IBOutlet weak var headerBar: AVLighterStickyHeaderView?
    @IBOutlet weak var headerImage: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var navButtonView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        
        //Progress 1 is when it's fully open & 0 is when it's fully collapsed
        self.headerBar?.getProgressValue({ progress in
            self.headerImage!.alpha = progress
            self.titleLabel!.alpha = 1.0 - progress
        })
        self.table?.reloadData()
    }
}


//MARK: Table delegate and datasource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table?.dequeueReusableCell(withIdentifier: "myCell",for: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1020
    }
}


//MARK: Setup View

extension ViewController {
    func setupView() {
        self.table?.contentInset = UIEdgeInsetsMake((headerBar?.frame.size.height)!, 0, 0, 0)
        headerBar?.frame.size.width = UIScreen.screenWidth
        navButtonView?.frame.size.width = UIScreen.screenWidth
        self.view.addSubview(headerBar!)
        self.view.addSubview(navButtonView!)
    }
}



// MARK: Actions
extension ViewController {
    @IBAction func backButtonAction(_ sender: AnyObject) {
        print("Put back event")
    }
    
    @IBAction func menuButtonAction(_ sender: AnyObject) {
        print("Put menu event")
    }
}


