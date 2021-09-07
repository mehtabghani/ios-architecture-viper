//  Created on 04/09/2021.

import Foundation

// object
// protocol
// reference to interactor
// reference to router
// reference to view



class UserDetailPresenter: UserDetailPresenterProtocol {
  
   
    var router: UserDetailRouterProtocol?
    var view: UserDetailViewProtocol?
    var interactor: UserDetailInteractorProtocol? {
        didSet {
            interactor?.getUser()
        }
    }
    
    func interactorDidFetchUser(_ user: User) {
        view?.update(with: user)
    }
    
    
}
