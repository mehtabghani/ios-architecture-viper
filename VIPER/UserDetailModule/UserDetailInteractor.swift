//  Created on 04/09/2021.

import Foundation

//object
// protocol
// reference to presenter

class UserDetailInteractor: UserDetailInteractorProtocol {
    var user: User?
    
    var presenter: UserDetailPresenterProtocol?
   
    func getUser() {
        
        guard let user = user else {
            return
        }
        
        self.presenter?.interactorDidFetchUser(user)
    }
    
}
