//
//  ViewController.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [cameraOpenActionButton, photosOpenActionButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var cameraOpenActionButton: ActionButton = {
        let temp = ActionButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return temp
    }()
    
    private lazy var photosOpenActionButton: ActionButton = {
        let temp = ActionButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return temp
    }()

    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        addMainStackView()
        setupData()
    }

    private func addMainStackView() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    private func setupData() {
        cameraOpenActionButton.setData(value: viewModel?.getCameraActionButtonData().setActionButtonListener(by: cameraActionListener))
        photosOpenActionButton.setData(value: viewModel?.getPhotosOpenActionButton().setActionButtonListener(by: photosActionListener))
    }
    
    private lazy var cameraActionListener : VoidBlock = { [weak self] in
        guard let self = self else { return }
        self.viewModel.openCamera { granted in
            granted ? (print("CAMERA GRANTED TO OPEN")) : self.firePermissionRequestView(with: .camera)
        }
    }
    
    private lazy var photosActionListener : VoidBlock = { [weak self] in
        guard let self = self else { return }
        self.viewModel.openCamera { granted in
            granted ? (print("PHOTOS GRANTED TO OPEN")) : self.firePermissionRequestView(with: .photo)
        }
    }

    private func firePermissionRequestView(with type: PermissionType) {
        present(PermissionViewBuilder.build(with: type), animated: true) {
            print("PERMISSION VIEW HAS JUST PRESENTED")
        }
    }

}
