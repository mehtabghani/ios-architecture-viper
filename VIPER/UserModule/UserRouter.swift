//  Created on 04/09/2021.

import Foundation
import UIKit
// object
// entry point

typealias EntryPoint = AnyView & UIViewController

class UserRouter: UserRouterProtocol {
   
    var entry: EntryPoint?
    
    static func create() -> UserRouterProtocol {
        let router = UserRouter()
        
        //Assign VIP
        
        var view: UserViewProtocol = UserViewController()
        var interactor: UserInteractorProtocol = UserInteractor()
        var presenter: UserPresenterProtocol = UserPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func navigateToDetailScene(for user: User, navigationController: UINavigationController) {
        
        let router = UserDetailRouter.create(with: user)
        let vc = router.entry!
        navigationController.pushViewController(vc, animated: true)
    }
}
