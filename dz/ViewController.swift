import UIKit
import SnapKit
class ViewController: UIViewController {
    var name: String = ""
    var author: String = ""
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    let nameAuthor: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    let counter: UILabel = {
        let label = UILabel()
        var counter = 10
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "\(counter)"
        return label
    }()
    let inc: UIButton = {
        let button = UIButton()
        button.setTitle("Инкремент", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(incbtn), for: .touchUpInside)
        return button
    }()
    let dec: UIButton = {
        let button = UIButton()
        button.setTitle("Декремент", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(decbtn), for: .touchUpInside)
        return button
    }()
    let null: UIButton = {
        let button = UIButton()
        button.setTitle("Обнулить", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(nullbtn), for: .touchUpInside)
        return button
    }()
    let changeName: UIButton = {
        let button = UIButton()
        button.setTitle("Сменить название счетчика", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(changeName1), for: .touchUpInside)
        return button
    }()
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название счетчика"
        return textField
    }()
    let changeAuthor: UIButton = {
        let button = UIButton()
        button.setTitle("Сменить имя автора", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(changeAuthor1), for: .touchUpInside)
        return button
    }()
    let authorTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя автора"
        return textField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        authorTextField.addTarget(self, action: #selector(authorFieldDidChange(_:)), for: .editingChanged)
    }
}
private extension ViewController {
    func setupScene() {
        title = "Счетчик"
        view.backgroundColor = .systemBackground
        view.addSubview(counter)
        view.addSubview(inc)
        view.addSubview(dec)
        view.addSubview(null)
        view.addSubview(changeName)
        view.addSubview(nameTextField)
        view.addSubview(nameLabel)
        nameLabel.text = "Счетчик \(name)"
        view.addSubview(nameTextField)
        view.addSubview(changeAuthor)
        authorTextField.isHidden = true
        view.addSubview(changeAuthor)
        view.addSubview(authorTextField)
        view.addSubview(nameAuthor)
        nameAuthor .text = "Автор \(author)"
        view.addSubview(authorTextField)
        view.addSubview(changeAuthor)
        authorTextField.isHidden = true
    }
    @objc func incbtn() {
        if let currentText = counter.text, let currentCount = Int(currentText) {
            let newCount = currentCount + 1
            counter.text = "\(newCount)"
        }
    }
    @objc func decbtn() {
        if let currentText = counter.text, let currentCount = Int(currentText) {
            let newCount = currentCount - 1
            counter.text = "\(newCount)"
        }
    }
    @objc func nullbtn() {
        if let currentText = counter.text, let currentCount = Int(currentText) {
            let newCount = currentCount - currentCount
            counter.text = "\(newCount)"
        }
    }
    @objc func changeName1() {
        nameTextField.isHidden = false
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        name = textField.text ?? ""
        nameLabel.text = "Счетчик \(name)"
    }
    @objc func changeAuthor1() {
        authorTextField.isHidden = false
    }
    @objc func authorFieldDidChange(_ textField: UITextField) {
        author = textField.text ?? ""
        nameAuthor.text = "Автор \(author)"
    }
    func makeConstraints() {
        counter.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview().inset(0)
        }
        inc.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(100)
        }
        dec.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(150)
        }
        null.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(200)
        }
        nameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        changeName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(250)
        }
        nameLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(0)
            $0.centerY.equalToSuperview().offset(-250)
        }
        authorTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-90)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        changeAuthor.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(300)
        }
        nameAuthor.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(0)
            $0.centerY.equalToSuperview().offset(-175)
        }
    }
}
