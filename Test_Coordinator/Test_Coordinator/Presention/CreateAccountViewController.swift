//
//  CreateAccountViewController.swift
//  Test_Coordinator
//
//  Created by 이준혁 on 2023/02/09.
//

import Foundation
import UIKit
import SnapKit

class CreateAccountViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    var selectedProduct = 0
    
    private var selectedProductLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedProductLabel.text = String(selectedProduct)
    }
}

// MARK: Configure
private extension CreateAccountViewController {
    func configureUI() {
        view.addSubview(selectedProductLabel)
        
        let defaultSpacing = 16.0
        
        selectedProductLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultSpacing*2)
            $0.leading.equalToSuperview().offset(defaultSpacing)
        }
    }
}
