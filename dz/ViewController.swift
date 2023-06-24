import UIKit
import SnapKit

class ViewController: UIViewController {
    let counter: UILabel = {
        let label = UILabel()
        var counter = 10
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
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        return textField
    }()
    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Greet Me!", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
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
        view.addSubview(myButton)
        view.addSubview(nameTextField)
    }
    
    @objc func buttonTapped() {
        let viewController = SecondViewControler()
        viewController.name = nameTextField.text ?? ""
        navigationController?.pushViewController(viewController, animated: true)
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
            
        }
        myButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
        }
    }
}
