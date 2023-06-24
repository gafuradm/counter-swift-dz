import UIKit
import SnapKit
class ThirdViewController: UIViewController {
    var name: String = ""
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ведите название счетчика"
        return textField
    }()
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сменить название счетчика"
        setupScene()
        makeConstraints()
    }
    private func setupScene() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameTextField)
        view.addSubview(saveButton)
        nameTextField.text = name
    }
    private func makeConstraints() {
        nameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        saveButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
        }
    }
    @objc private func saveButtonTapped() {
        if let viewController = navigationController?.viewControllers.first as? ViewController {
            viewController.name = nameTextField.text ?? ""
        }
    }
}
