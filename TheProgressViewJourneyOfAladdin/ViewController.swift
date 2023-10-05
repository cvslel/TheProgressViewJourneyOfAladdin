//
//  ViewController.swift
//  TheProgressViewJourneyOfAladdin
//
//  Created by Cenker Soyak on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var progressBar = UIProgressView()
    var progressValue: Int = 0
    var counter = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    @objc func valueChanged(){
        progressValue += 1
        progressBar.progress = Float(progressValue)/Float(10)
        counter.text = String(Int(progressBar.progress * 100))
        if progressValue > 10 {
            progressBar.progress = 0
            counter.text = "0"
            progressValue = 0
        }
    }
    func createUI(){
        view.backgroundColor = .white
        progressBar.progress = 0
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(90)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(10)
        }
        let plusButton = UIButton()
        plusButton.setTitle("Add", for: UIControl.State.normal)
        plusButton.backgroundColor = .darkGray
        plusButton.addTarget(self, action: #selector(valueChanged), for: .touchUpInside)
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(50)
            make.right.equalTo(view.snp.right).offset(-50)
        }
        counter.text = "%0"
        view.addSubview(counter)
        counter.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(self.view.center)
        }
    }
}
