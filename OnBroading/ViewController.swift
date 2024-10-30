import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageControlDot: UIPageControl!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var pageTitleDetailLabel: UILabel!
    
    private let skipButton = UIButton()
    private let nextButton = UIButton()
    private let startButton = UIButton()
    
    private var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseUi()
        setFirstPageUi()
    }
    
    private func setBaseUi() {
        // Config skipButton
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(UIColor.black, for: .normal)
        skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Config nextButton
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        nextButton.backgroundColor = UIColor.black
        nextButton.layer.cornerRadius = 34
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Config startButton
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        startButton.backgroundColor = UIColor.black
        startButton.layer.cornerRadius = 34
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(skipButton)
        mainView.addSubview(nextButton)
        mainView.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            // Set layout for skipButton
            skipButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 58),
            skipButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -73),
            
            // Set layout for nextButton
            nextButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -58),
            nextButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50),
            nextButton.widthAnchor.constraint(equalToConstant: 118),
            nextButton.heightAnchor.constraint(equalToConstant: 68),
            
            // Set layout for startButton (invisible by default)
            startButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -96),
            startButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 96),
            startButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant: 68)
        ])
        
        skipButton.addTarget(self, action: #selector(skipUiPage), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextUiPage), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(nextUiPage), for: .touchUpInside)
    }
    
    private func setFirstPageUi() {
        mainView.backgroundColor = UIColor(named: "FirstScreenBackgroundColor")
        pageImage.image = UIImage(named: "ImageFirstScreen")
        pageControlDot.currentPage = 0
        pageTitleLabel.text = "Track your work and get the result"
        pageTitleDetailLabel.text = "Remember to keep track of your professional accomplishments."
        
        nextButton.isHidden = false
        startButton.isHidden = true
        skipButton.isHidden = false
    }
    
    private func setSecondPageUi() {
        mainView.backgroundColor = UIColor(named: "SecondScreenBackgroundColor")
        pageImage.image = UIImage(named: "ImageSecondScreen")
        pageControlDot.currentPage = 1
        pageTitleLabel.text = "Stay organized with team "
        pageTitleDetailLabel.text = "But understanding the contributions our colleagues make to our teams and companies"
        
        nextButton.isHidden = false
        startButton.isHidden = true
        skipButton.isHidden = false
    }
    
    private func setThirdPageUi() {
        mainView.backgroundColor = UIColor(named: "ThirdScreenBackgroundColor")
        pageImage.image = UIImage(named: "ImageThirdScreen")
        pageControlDot.currentPage = 2
        pageTitleLabel.text = "Get notified when work happens"
        pageTitleDetailLabel.text = "Take control of notifications, collaborate live or on your own time"
        
        startButton.isHidden = false
        nextButton.isHidden = true
        skipButton.isHidden = true
    }
    
    @objc private func skipUiPage() {
        currentPage = 2
        currentPageUpdate(currentPage: currentPage)
    }
    
    @objc private func nextUiPage() {
        if currentPage < 2 {
            currentPage += 1
        } else {
            currentPage = 0
        }
        currentPageUpdate(currentPage: currentPage)
    }
    
    private func currentPageUpdate(currentPage : Int) {
        switch currentPage {
        case 0:
            setFirstPageUi()
        case 1:
            setSecondPageUi()
        case 2:
            setThirdPageUi()
        default:
            setFirstPageUi()
        }
    }
}
