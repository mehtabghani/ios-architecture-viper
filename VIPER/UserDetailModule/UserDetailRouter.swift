//  Created on 04/09/2021.

import Foundation
import UIKit
// object
// entry point


class UserDetailRouter: UserDetailRouterProtocol {
   
    var entry: EntryPoint?
    
    static func create(with user: User) -> UserDetailRouterProtocol {
    
        let router = UserDetailRouter()
        
        //Assign VIP
        
        var view: UserDetailViewProtocol = UserDetailViewController()
        var interactor: UserDetailInteractorProtocol = UserDetailInteractor()
        var presenter: UserDetailPresenterProtocol = UserDetailPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.user = user
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
