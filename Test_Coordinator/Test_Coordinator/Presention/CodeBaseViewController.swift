//
//  CodeBaseViewController.swift
//  Test_Coordinator
//
//  Created by 이준혁 on 2023/02/09.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class CodeBaseViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "CodeBaseViewController"
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        bindAll()
    }
}

// MARK: Binding
extension CodeBaseViewController {
    func bindAll() {
        
    }
}

// Mark: Configure
extension CodeBaseViewController {
    func configureLayout() {
        let defaultSpacing = 16.0
        
        view.addSubview(infoLabel)
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultSpacing)
            $0.leading.equalToSuperview().offset(defaultSpacing)
        }
    }
}
