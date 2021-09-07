//  Created on 05/09/2021.

import UIKit

class UserDetailViewController: UIViewController, UserDetailViewProtocol {
    
    // MARK: Outlet

    @IBOutlet weak var lblName: UILabel!
    
    // MARK: Var
    var presenter: UserDetailPresenterProtocol?
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        populateUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func populateUI() {
        
        guard let user = user else {
            return
        }
        
        lblName.text = user.name
    }
    
    func update(with user: User) {
        self.user = user
    }
    
    func update(with error: String) {
        
    }

}
