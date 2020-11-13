//
//  LoginViewController.swift
//  TestTask
//
//  Created by Кирилл Романенко on 12.11.2020.
//

import UIKit

class LoginViewController: RoutableViewController<LoginViewPresenterProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadViews()
    }
    
    //MARK: - Methods
    
    @objc private func validateEmail() {
        if let email = emailTextField.text?.trimmingCharacters(in: .whitespaces) {
            if presenter.isValid(email), passwordTextField.text != "" {
                loginButton.isEnabled = true
                loginButton.alpha = 1
            } else {
                loginButton.isEnabled = false
                loginButton.alpha = 0.4
            }
        }
    }
    
    @objc private func goToRecoveryScreen() {
        presenter.goToRecoveryScreen(from: self)
    }
    
    @objc private func appleSignIn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.flash(0.4)
            sender.flash(1)
        }
    }
    
    @objc private func facebookSignIn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.flash(0.4)
            sender.flash(1)
        }
    }
    
    @objc private func loginAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.flash(0.4)
            sender.flash(1)
        }
    }
    
    @objc private func securePass() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            secureSlashView.isHidden = false
        } else {
            passwordTextField.isSecureTextEntry = true
            secureSlashView.isHidden = true
        }
    }
    
    private func loadViews() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        createYellowLine()
        createEmailTextField()
        createPasswordTextField()
        createLoginButton()
        createLogoLabel()
        createLoginLabel()
        createRasswordForgotLabel()
        createOrLabel()
        createAppleSingInButton()
        createFacebookSignInButton()
        createAgreesLabel()
        createAccountLabel()
    }
    
    //MARK: - Creation views
    
    private var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Logo"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private var orLabel: UILabel = {
        let label = UILabel()
        label.text = "ИЛИ"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "У меня уже есть аккаунт"
        label.textColor = #colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.4078431373, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    private var agreesLabel: UILabel = {
        let label = UILabel()
        let normalString = NSMutableAttributedString(string: "Продолжая использование, вы принимаете условия ")
        let underLinedString = "пользовательского соглашения и политики конфиденциальности"
        let attributedString = NSMutableAttributedString(string: underLinedString)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, underLinedString.count))
        normalString.append(attributedString)
        label.attributedText = normalString
        label.textAlignment = .center
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private var passwordForgotLabel: UILabel = {
        let label = UILabel()
        label.text = "Забыли пароль?"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    private var yellowLineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.yellowLine
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Адрес электронной почты"
        textField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.grayTest.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private var passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        textField.placeholder = "Пароль"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.grayTest.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private var loginButton: RoundedButton = {
        let btn = RoundedButton()
        btn.backgroundColor = .blueTest
        btn.isEnabled = false
        btn.alpha = 0.4
        btn.setTitle("Войти", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
    private var appleSingInButton: RoundedButton = {
        let btn = RoundedButton()
        btn.backgroundColor = .black
        btn.setTitle("Войти через Apple ID", for: .normal)
        btn.setImage(Image.appleLogo, for: .normal)
        btn.imageEdgeInsets.left = -20
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
    private var facebookSignInButton: RoundedButton = {
        let btn = RoundedButton()
        btn.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.4666666667, blue: 0.9490196078, alpha: 1)
        btn.setTitle("Войти через Facebook", for: .normal)
        btn.setImage(Image.facebookLogo, for: .normal)
        btn.imageEdgeInsets.left = -20
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        btn.titleLabel?.textAlignment = .center
        return btn
    }()
    
    private var secureEyeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.eye
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var secureSlashView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image = Image.slash
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
}

//MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    
    //MARK: - Constraints
    
    private func createEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 243)
        ].forEach{ $0.isActive = true }
        
        emailTextField.layoutSubviews()
        emailTextField.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
        emailTextField.delegate = self
    }
    
    private func createPasswordTextField() {
        
        view.addSubview(passwordTextField)
        view.addSubview(secureEyeView)
        view.addSubview(secureSlashView)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10)
        ].forEach{ $0.isActive = true }
        
        secureEyeView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            secureEyeView.heightAnchor.constraint(equalToConstant: 10),
            secureEyeView.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            secureEyeView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -20)
        ].forEach{ $0.isActive = true }
        
        secureSlashView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            secureSlashView.heightAnchor.constraint(equalToConstant: 10),
            secureSlashView.centerYAnchor.constraint(equalTo: secureEyeView.centerYAnchor),
            secureSlashView.centerXAnchor.constraint(equalTo: secureEyeView.centerXAnchor)
        ].forEach{ $0.isActive = true }
        
        passwordTextField.layoutSubviews()
        passwordTextField.isSecureTextEntry = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(securePass))
        secureEyeView.addGestureRecognizer(tap)
        secureEyeView.isUserInteractionEnabled = true
        
        passwordTextField.addTarget(self, action: #selector(validateEmail), for: .editingChanged)
        passwordTextField.delegate = self
    }
    
    private func createLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
        ].forEach{ $0.isActive = true }
        
        loginButton.layoutSubviews()
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    
    private func createAppleSingInButton() {
        view.addSubview(appleSingInButton)
        appleSingInButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            appleSingInButton.heightAnchor.constraint(equalToConstant: 60),
            appleSingInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            appleSingInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            appleSingInButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 30)
        ].forEach{ $0.isActive = true }
        
        appleSingInButton.layoutSubviews()
        appleSingInButton.addTarget(self, action: #selector(appleSignIn), for: .touchUpInside)
    }
    
    private func createFacebookSignInButton() {
        view.addSubview(facebookSignInButton)
        facebookSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            facebookSignInButton.heightAnchor.constraint(equalToConstant: 60),
            facebookSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            facebookSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
            facebookSignInButton.topAnchor.constraint(equalTo: appleSingInButton.bottomAnchor, constant: 10)
        ].forEach{ $0.isActive = true }
        
        facebookSignInButton.layoutSubviews()
        facebookSignInButton.addTarget(self, action: #selector(facebookSignIn), for: .touchUpInside)
    }
    
    private func createRasswordForgotLabel() {
        view.addSubview(passwordForgotLabel)
        passwordForgotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            passwordForgotLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            passwordForgotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ].forEach{ $0.isActive = true }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToRecoveryScreen))
        passwordForgotLabel.addGestureRecognizer(tap)
        passwordForgotLabel.isUserInteractionEnabled = true
    }
    
    private func createYellowLine() {
        view.addSubview(yellowLineImageView)
        yellowLineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            yellowLineImageView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowLineImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            yellowLineImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            loginLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -20),
            loginLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createLogoLabel() {
        view.addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            logoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5)
        ].forEach{ $0.isActive = true }
    }
    
    private func createOrLabel() {
        view.addSubview(orLabel)
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            orLabel.topAnchor.constraint(equalTo: passwordForgotLabel.bottomAnchor, constant: 30),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createAccountLabel() {
        view.addSubview(accountLabel)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            accountLabel.bottomAnchor.constraint(equalTo: agreesLabel.topAnchor, constant: -20),
            accountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ].forEach{ $0.isActive = true }
    }
    
    private func createAgreesLabel() {
        view.addSubview(agreesLabel)
        agreesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            agreesLabel.widthAnchor.constraint(equalToConstant: 300),
            agreesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            agreesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ].forEach{ $0.isActive = true }
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
