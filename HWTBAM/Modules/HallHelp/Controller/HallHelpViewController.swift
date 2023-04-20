//
//  HallHelpViewController.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import UIKit

final class HallHelpViewController: UIViewController {
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pillarsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .bottom
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let firstPercentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondPercentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thirdPercentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fourthPercentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .bottom
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "A"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "B"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thirdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "C"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fourthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "D"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let variantsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .bottom
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 1
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var hallHelpViewModel: HallHelpModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupViewController()
    }
    
    func setupHallHelp(with model: HallHelpModel) {
        hallHelpViewModel = model
        firstPercentLabel.text = "\(model.firstValue / 5) %"
        secondPercentLabel.text = "\(model.secondValue / 5) %"
        thirdPercentLabel.text = "\(model.thirdValue / 5) %"
        fourthPercentLabel.text = "\(model.fourthValue / 5) %"
    }
}

private extension HallHelpViewController {
    func setupViewController() {
        addSubviews()
        setConstaints()
    }
    
    func addSubviews() {
        pillarsStackView.addArrangedSubview(firstView)
        pillarsStackView.addArrangedSubview(secondView)
        pillarsStackView.addArrangedSubview(thirdView)
        pillarsStackView.addArrangedSubview(fourthView)
        
        percentsStackView.addArrangedSubview(firstPercentLabel)
        percentsStackView.addArrangedSubview(secondPercentLabel)
        percentsStackView.addArrangedSubview(thirdPercentLabel)
        percentsStackView.addArrangedSubview(fourthPercentLabel)
        
        variantsStackView.addArrangedSubview(firstLabel)
        variantsStackView.addArrangedSubview(secondLabel)
        variantsStackView.addArrangedSubview(thirdLabel)
        variantsStackView.addArrangedSubview(fourthLabel)
        
        mainStackView.addArrangedSubview(pillarsStackView)
        mainStackView.addArrangedSubview(percentsStackView)
        mainStackView.addArrangedSubview(variantsStackView)
        
        view.addSubview(mainStackView)
    }
    
    func setConstaints() {
        guard let model = hallHelpViewModel else { fatalError() }
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            firstView.heightAnchor.constraint(equalToConstant: CGFloat(model.firstValue)),
            secondView.heightAnchor.constraint(equalToConstant: CGFloat(model.secondValue)),
            thirdView.heightAnchor.constraint(equalToConstant: CGFloat(model.thirdValue)),
            fourthView.heightAnchor.constraint(equalToConstant: CGFloat(model.fourthValue))
        ])
    }
}
