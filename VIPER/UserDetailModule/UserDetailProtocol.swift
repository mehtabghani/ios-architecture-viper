//  Created on 05/09/2021.

import Foundation

protocol UserDetailViewProtocol: AnyView {
    
    var presenter: UserDetailPresenterProtocol? { get set }

    func update(with user: User)
    func update(with error: String)
}

protocol UserDetailInteractorProtocol {
    var user: User? { get set }
    var presenter: UserDetailPresenterProtocol? { get set }

    func getUser()
}

protocol UserDetailPresenterProtocol {
    
    var router: UserDetailRouterProtocol? { get set }
    var interactor: UserDetailInteractorProtocol? { get set }
    var view: UserDetailViewProtocol? { get set }
    
    func interactorDidFetchUser(_ user: User)

}

protocol UserDetailRouterProtocol {
    var entry: EntryPoint? { get }
    static func create(with user: User) -> UserDetailRouterProtocol
}
