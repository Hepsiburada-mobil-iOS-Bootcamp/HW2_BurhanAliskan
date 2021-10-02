//
//  PermissionView.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 2.10.2021.
//

import UIKit

class PermissionView: GenericBaseView<PermissionViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageView, infoView, actionComponent])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    private lazy var infoView: InfoView = {
        let temp = InfoView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var actionComponent: ActionModule = {
        let temp = ActionModule()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupLayerConfigurations()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        
        ])
    }
    
    private func setupLayerConfigurations() {
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        imageView.image = data.image
        infoView.setData(value: data.infoViewData)
        actionComponent.setData(value: data.actionComponentData)
    }
    
}
