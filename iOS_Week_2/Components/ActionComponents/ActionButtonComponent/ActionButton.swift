//
//  ActionButton.swift
//  iOS_Week_2
//
//  Created by Burhan Alışkan on 25.09.2021.
//

import UIKit
class ActionButton: GenericBaseView<ActionButtonData> {
    
    private lazy var shadowContainerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.robotoBlackItalic(15).value
        temp.contentMode = .center
        temp.textAlignment = .center
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addContainerView()
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        addTapGesture()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else {return}
        
        titleLabel.text = data.text
        switch data.buttonType {
        case .filled(let theme):
            containerView.backgroundColor = theme.value
            titleLabel.textColor = .white
        case .outlined(let theme):
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = theme.value.cgColor
            containerView.backgroundColor = .white
            titleLabel.textColor = theme.value
        }
    }
    
    private func addContainerView() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
        ])
    }
    
    private func pressedButtonAction() {
        guard let data = returnData() else { return }
        data.actionButtonListener?()
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension ActionButton: UIGestureRecognizerDelegate {
    
    @objc fileprivate func actionButtonTapped(_ sender: UITapGestureRecognizer) {
        guard let data = returnData() else { return }
        startPressedAnimationCommon(withDuration: 0.3) { [weak self] finish in
            data.actionButtonListener?()
        }
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .actionButtonTapped)
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
}

fileprivate extension Selector {
    static let actionButtonTapped = #selector(ActionButton.actionButtonTapped)
}
