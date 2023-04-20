import UIKit
import AVFoundation

class LoginViewController: UIViewController {
    
    let music = MusicModel()
    let buttonMusic = MusicModel()
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background2")
        image.contentMode = .scaleAspectFill
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
    
    private let nameLoginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private let passwordLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите пароль"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let passwordLoginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        textField.textColor = .white
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = UIColor(named: "Blue")
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapRegestrationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = UIColor(named: "Blue")
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var guestButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapGuestButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти как гость", for: .normal)
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
    
    let storage: KeyValueStorage = SharedStorage()
    let userService = UserService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        music.playSound(nameOfMusic: "Rules Music")
    }
    
    @objc
    private func didTapLoginButton() {
        userLogin()
    }
    
    @objc
    private func didTapRegestrationButton() {
        buttonMusic.playSound(nameOfMusic: "Button Push")
        let rulesVC = RegistrationViewController()
        rulesVC.modalPresentationStyle = .fullScreen
        present(rulesVC, animated: true)
    }
    
    @objc
    private func didTapGuestButton() {
        buttonMusic.playSound(nameOfMusic: "Button Push")
        let viewController = MainGameViewController()
        viewController.setupLoginLabel("Гость")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
        music.player?.stop()
    }
}

private extension LoginViewController {
    func userLogin() {

        let login = nameLoginTextField.text?.trimmingCharacters(in: .whitespaces)
        let password = passwordLoginTextField.text?.trimmingCharacters(in: .whitespaces)

        if login != "" && password != "" {
            wrongLogPas()

        guard let key = login else { return }
            if let userData = storage.getValueData(key: key) {
                let decoder = JSONDecoder()
                let user = try? decoder.decode(UserStruct.self, from: userData)
                if password == user?.password {
                    let viewController = MainGameViewController()
                    guard let name = user?.loginName else { fatalError() }
                    viewController.modalPresentationStyle = .fullScreen
                    viewController.setupLoginLabel(name)
                    music.playSound(nameOfMusic: "Button Push")
                    present(viewController, animated: false)
                } else {
                    wrongLogPas()
                }
            }
        } else {
            emptyLogPas()
        }
    }
    
    func emptyLogPas() {
        nameLoginLabel.text = "write login and password please"
        nameLoginLabel.font = .systemFont(ofSize: 20)
        nameLoginLabel.textColor = .darkGray
    }
    
    func wrongLogPas() {
        nameLoginLabel.text = "WRONG LOGIN OR PASSWORD"
        nameLoginLabel.font = .systemFont(ofSize: 20)
        nameLoginLabel.textColor = .darkGray
    }
    
    func setupViewController() {
        addSubviews()
        setConstraint()
    }
    
    func addSubviews() {
        mainStackView.addArrangedSubview(nameLoginLabel)
        mainStackView.addArrangedSubview(nameLoginTextField)
        mainStackView.addArrangedSubview(passwordLoginLabel)
        mainStackView.addArrangedSubview(passwordLoginTextField)
        mainStackView.addArrangedSubview(loginButton)
        mainStackView.addArrangedSubview(registrationButton)
        mainStackView.addArrangedSubview(guestButton)
        
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
            
            mainStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}
