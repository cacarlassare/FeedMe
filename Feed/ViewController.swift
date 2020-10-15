
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction fileprivate func register() {
        guard let username = self.usernameTextField.text,
              let password = self.passwordTextField.text,
              !username.isEmpty, !password.isEmpty else
                 {
            return
        }
        
        APIManager.register(user: username, password: password) {
            self.showAlert(message: "Registered successfully")
        } onError: { (error) in
            self.handleError(error: error)
        }
    }
    
    @IBAction fileprivate func login() {
        guard let username = self.usernameTextField.text,
              let password = self.passwordTextField.text,
              !username.isEmpty, !password.isEmpty else
                 {
            return
        }
        
        APIManager.login(user: username, password: password) {
            self.showAlert(message: "Logged in successfully")
        } onError: { (error) in
            self.handleError(error: error)
        }
    }
    
    @IBAction fileprivate func subscribeToLaNacion() {
        let laNacionFeedURL = "http://contenidos.lanacion.com.ar/herramientas/rss-origen=2"
        
        APIManager.subscribe(feedURL: laNacionFeedURL) { (feed) in
            self.showAlert(message: "Subscribed successfully")
        } onError: { (error) in
            self.handleError(error: error)
        }
    }

    
    fileprivate func handleError(error: Error?) {
        if let error = error {
            self.showAlert(message: error.localizedDescription)
        } else {
            self.showAlert(message: "Unknown Error")
        }
    }
}

