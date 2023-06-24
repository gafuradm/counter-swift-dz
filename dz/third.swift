import UIKit
import SnapKit
class ThirdViewController: UIViewController {
    var author: String = ""
    let authorTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ведите имя автора"
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
        title = "Сменить имя автора"
        setupScene()
        makeConstraints()
    }
    private func setupScene() {
        view.backgroundColor = .systemBackground
        view.addSubview(authorTextField)
        view.addSubview(saveButton)
        authorTextField.text = author
    }
    private func makeConstraints() {
        authorTextField.snp.makeConstraints {
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
            viewController.author = self.authorTextField.text ?? ""
            viewController.nameAuthor.text = "Автор \(self.authorTextField.text ?? "")"
        }
    }
}
