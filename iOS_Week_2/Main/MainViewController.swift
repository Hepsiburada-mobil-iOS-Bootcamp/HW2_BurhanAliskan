//
//  ViewController.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit

class MainViewController: UIViewController {

    private var actionStackView: ActionModule!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addStackView()
        setupActionModuleData()
    }
    
    private func addStackView() {
        actionStackView = ActionModule()
        actionStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionStackView)
        
        NSLayoutConstraint.activate([
        
            actionStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
        
        ])
    }
    
    private func setupActionModuleData() {
        let negativeButtonData = ActionButtonData(text: "Not Now", buttonType: .outlined(.smooth)).setActionButtonListener {
            print("Negative Fired")
        }
        
        let positiveButtonData = ActionButtonData(text: "OK", buttonType: .filled(.smooth)).setActionButtonListener {
            print("Positive Fired")
        }
        
        actionStackView.setData(value: ActionModuleData(negativeButtonData: negativeButtonData, positiveButtonData: positiveButtonData))
    }


}

