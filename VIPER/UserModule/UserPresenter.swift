//  Created on 04/09/2021.

import Foundation
import UIKit

// object
// protocol
// reference to interactor
// reference to router
// reference to view


enum APIError: Error {
    case failed(String?)
}

class UserPresenter: UserPresenterProtocol {
   
    var router: UserRouterProtocol?
    var view: UserViewProtocol?
    var interactor: UserInteractorProtocol? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    func interactorDidFetchUser(with result: Result<[User], Error>) {
     
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something went wrong.")
        }
    }
    
    func showDetails(of user: User, navigationController: UINavigationController) {
        router?.navigateToDetailScene(for: user, navigationController: navigationController)
    }
    
}
