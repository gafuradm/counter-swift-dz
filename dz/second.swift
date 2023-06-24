import UIKit
import SnapKit

class SecondViewControler: UIViewController {
    
    var name: String = ""
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(myLabel)
        myLabel.snp.makeConstraints{
        $0.center.equalToSuperview()
        
        }
        myLabel.text = "Hello, \(name)"
    }
}
