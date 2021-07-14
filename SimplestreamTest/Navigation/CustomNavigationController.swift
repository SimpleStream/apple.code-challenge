//
//  CustomNavigationController.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
