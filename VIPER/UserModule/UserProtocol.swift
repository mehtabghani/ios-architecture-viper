//  Created on 05/09/2021.

import Foundation
import UIKit

protocol UserViewProtocol: AnyView {
    
    var presenter: UserPresenterProtocol? { get set }

    func update(with users: [User])
    func update(with error: String)
}

protocol UserInteractorProtocol {
    
    var presenter: UserPresenterProtocol? { get set }

    func getUsers()
}

protocol UserPresenterProtocol {
    
    var router: UserRouterProtocol? { get set }
    var interactor: UserInteractorProtocol? { get set }
    var view: UserViewProtocol? { get set }
    
    func interactorDidFetchUser(with result: Result<[User], Error>)
    func showDetails(of user: User, navigationController: UINavigationController)
}

protocol UserRouterProtocol {
    var entry: EntryPoint? { get }
    static func create() -> UserRouterProtocol
    
    func navigateToDetailScene(for user: User, navigationController: UINavigationController)
}
