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
    let changeAuthor: UIButton = {
        let button = UIButton()
        button.setTitle("Сменить имя автора", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(changeAuthor1), for: .touchUpInside)
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
        view.addSubview(changeName)
        view.addSubview(nameLabel)
        nameLabel.text = "Счетчик \(name)"
        view.addSubview(changeAuthor)
        view.addSubview(changeAuthor)
        view.addSubview(nameAuthor)
        nameAuthor .text = "Автор \(author)"
        view.addSubview(changeAuthor)
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
        let viewController = SecondViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func changeAuthor1() {
        let viewController = ThirdViewController()
        navigationController?.pushViewController(viewController, animated: true)
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
        changeName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(250)
        }
        nameLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(0)
            $0.centerY.equalToSuperview().offset(-250)
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
