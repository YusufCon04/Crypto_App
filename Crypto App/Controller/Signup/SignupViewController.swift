import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    @IBOutlet var SignUpUserNameLabel: UILabel!
    @IBOutlet var SignUpPasswordLabel: UILabel!
    

    
    @IBOutlet weak var SignUpUserNameTextField: UITextField!
    @IBOutlet weak var SignUpPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segue.identifier --> segue ıcın TC kımlık no
        //segue.destination --> gidilecek sayfa
        
        // segue.destination.navigationItem.title = userNameTextField.text
        //segue.destination.navigationItem.title = SignUpPasswordTextField.text
        
        
    }
    
    @IBAction func tapSignUpButton(_ sender: UIButton)
    {
      // performSegue(withIdentifier: "goToNextSignup", sender: nil)
         if SignUpUserNameTextField.text != "" && SignUpPasswordTextField.text != "" {
         Auth.auth().createUser(withEmail: SignUpUserNameTextField.text!, password: SignUpPasswordTextField.text!) {(authdata, error) in
         if error != nil {
         self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
         } else {
             let vc: ListViewController = ListViewController()
             self.navigationController?.setViewControllers([vc], animated: true)
//             self.performSegue(withIdentifier: "goToNextSignup", sender: nil)
         }
         }
         } else {
         makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
         }
    }
    
         func makeAlert(titleInput:String, messageInput:String) {
         let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle:
         UIAlertController.Style.alert)
         let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
         alert.addAction(okButton)
         self.present(alert, animated: true, completion: nil)
         }
    
     // performSegue(withIdentifier: "goToNextSignup", sender: nil)

    }

