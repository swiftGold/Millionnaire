//
//  ResultViewController.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 11.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image 1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы выиграли"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "00000"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    Ваш лучший счет:
                    0
                    """
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(playAgainButtonTapped), for: .touchUpInside)
        button.setTitle("Play Again", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .none
        stack.spacing = 10
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var winBrain = WinBrain()
    var mainGameBrain = MainGameBrain()
    var viewModel: ResultModel?
    let userService = UserService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayot()
        setConstraints()
    }

    func setupResultViewController(_ model: ResultModel) {
        viewModel = model

        mainLabel.text = "\(model.name) выиграл"
        subLabel.text = model.prizeMoney
        highScoreLabel.text = """
                    Ваш лучший счет:
                    \(String(setScore()))
                    """
    }
    
    @objc func playAgainButtonTapped() {
        guard let loginName = viewModel?.name else { fatalError() }
        let viewController = MainGameViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.setupLoginLabel(loginName)
        present(viewController, animated: false)
    }
    
    func setScore() -> Int {
        guard let key = viewModel?.name else { fatalError() }

        if key != "Гость" {
            guard let newScoreString = viewModel?.prizeMoney.replacingOccurrences(of: " ", with: "") else { fatalError() }
            
            guard let newScoreInt = Int(newScoreString) else { fatalError() }
            let user = userService.getUser(key: key)
            let userName = user.loginName
            let userPassword = user.password
            var userBestScore = user.moneySum
            if newScoreInt > userBestScore {
                userBestScore = newScoreInt
            }
            userService.saveUser(user: UserStruct(loginName: userName, password: userPassword, moneySum: userBestScore))
            let newUser = userService.getUser(key: userName)
            return newUser.moneySum
        } else {
            highScoreLabel.isHidden = true
            return 0
        }
    }
    
    private func setLayot() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(labelStackView)
        view.addSubview(playAgainButton)
        
        labelStackView.addArrangedSubview(mainLabel)
        labelStackView.addArrangedSubview(subLabel)
        labelStackView.addArrangedSubview(highScoreLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImageView.heightAnchor.constraint(equalToConstant: 225),
            logoImageView.widthAnchor.constraint(equalToConstant: 225),
            
            labelStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelStackView.heightAnchor.constraint(equalToConstant: 200),
            
            playAgainButton.heightAnchor.constraint(equalToConstant: 50),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
}

