//
//  ViewController.swift
//  TestAsysn
//
//  Created by tuannv on 8/31/16.
//  Copyright © 2016 vn.test. All rights reserved.
//

import UIKit

import AsyncDisplayKit



class ViewController: UIViewController , ASTableViewDelegate , ASTableViewDataSource{
    
    var tableView : ASTableView!
    
    let sampleText = "AsyncDisplayKit's basic unit is the node. An ASDisplayNode is an abstraction over UIView, which in turn is an abstraction over CALayer. Unlike views, which can only be used on the main thread, nodes are thread-safe: you can instantiate and configure entire hierarchies of them in parallel on background threads."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = ASTableView()
        
        tableView.asyncDataSource = self
        tableView.asyncDelegate   = self
        
        
        self.view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : table datasour, delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        
        return {
            let cell = HomeCellNode()
            cell.titleLabel.attributedString = NSAttributedString(string: self.sampleText)
            cell.timeLabel.attributedString  = NSAttributedString(string: "01/01/2011")
            cell.thumbnailImage.image =  UIImage(named: "1-freepik.jpg")
            
            return cell
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView?.frame = self.view.frame
    }
    
}

