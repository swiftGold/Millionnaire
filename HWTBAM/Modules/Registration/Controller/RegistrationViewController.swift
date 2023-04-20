//
//  RegistrationViewController.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//
import UIKit
import AVFoundation

class RegistrationViewController: UIViewController {

    let music = MusicModel()
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background2")
        return image
    }()

    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image 1")
        return image
    }()

    private let nameLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите имя"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let nameRegistrationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter here"
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private let passwordRegistrationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите пароль"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let passwordRegistrationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter here"
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = UIColor(named: "Blue")
        button.layer.cornerRadius = 12
        return button
    }()
  
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let userService = UserService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    @objc
    private func didTapConfirmButton() {
        if nameRegistrationTextField.text != "" && passwordRegistrationTextField.text != "" {
            setStorage()
            music.playSound(nameOfMusic: "Button Push")
            Thread.sleep(forTimeInterval: 0.3)
            dismiss(animated: true)
        } else {
            nameLoginLabel.text = "заполните логин и пароль"
            nameLoginLabel.textColor = .red
        }
    }
}

private extension RegistrationViewController {
    
    private func setStorage() {
        guard let loginValue = nameRegistrationTextField.text?.trimmingCharacters(in: .whitespaces) else { fatalError() }
        guard let passwordValue = passwordRegistrationTextField.text?.trimmingCharacters(in: .whitespaces) else { fatalError() }
        let newUser = UserStruct(loginName: loginValue, password: passwordValue, moneySum: 0)
        userService.saveUser(user: newUser)
    }
  
    func setupViewController() {
        addSubviews()
        setConstraint()
    }
    
    func addSubviews() {
        mainStackView.addArrangedSubview(nameLoginLabel)
        mainStackView.addArrangedSubview(nameRegistrationTextField)
        mainStackView.addArrangedSubview(passwordRegistrationLabel)
        mainStackView.addArrangedSubview(passwordRegistrationTextField)
        mainStackView.addArrangedSubview(confirmButton)

        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(mainStackView)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
}
