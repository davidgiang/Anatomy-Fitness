//
//  ViewController.swift
//  Anatomy Fitness
//
//  Created by David Giang on 10/11/20.
//  Copyright © 2020 David Giang. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    lazy var frontViewController: FrontViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "FrontViewController") as! FrontViewController
        
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    lazy var backViewController: BackViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "BackViewController") as! BackViewController
        
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }

    private func setupView(){
        setupSegmentedControl()
        
        updateView()
    }
    
    private func updateView(){
        frontViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
        backViewController.view.isHidden = (segmentedControl.selectedSegmentIndex == 0)
    }
    
    private func setupSegmentedControl(){
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Front", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Back", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(sender: UISegmentedControl){
        updateView()
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        addChild(childViewController)
        
        view.addSubview(childViewController.view)
        
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        childViewController.didMove(toParent: self)
    }

}

