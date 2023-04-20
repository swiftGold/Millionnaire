//
//  LoseScreenViewController.swift
//  HWTBAM
//
//  Created by Fazil Jabbarov 11 on 08.02.2023.
//

import UIKit

class LoseScreenViewController: UIViewController {
    
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
        label.text = "Вы проиграли!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
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
        label.font = .boldSystemFont(ofSize: 24)
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
    
    let userService = UserService.shared
    var winBrain = WinBrain()
    var mainGameBrain = MainGameBrain()
    var loginNick = ""
    var viewModel: LoseViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayot()
        setConstraints()
    }

    func setupLoseViewController(with model: LoseViewModel, with name: String) {
        loginNick = name
        viewModel = model
        subLabel.text = "Ваш выигрыш составил: \(model.safeMoney) руб."
        highScoreLabel.text = """
                    Ваш лучший счет:
                    \(String(setScore()))
                    """
    }
    
    @objc func playAgainButtonTapped() {
        let loginName = loginNick
        let viewController = MainGameViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.setupLoginLabel(loginName)
        present(viewController, animated: false)
    }
    
    func setScore() -> Int {
        let key = loginNick

        if key != "Гость" {
            guard let newScoreString = viewModel?.safeMoney.replacingOccurrences(of: " ", with: "") else { fatalError() }
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

