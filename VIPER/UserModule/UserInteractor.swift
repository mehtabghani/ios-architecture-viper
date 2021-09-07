//  Created on 04/09/2021.

import Foundation

//object
// protocol
// reference to presenter



class UserInteractor: UserInteractorProtocol {
    var presenter: UserPresenterProtocol?
        
    func getUsers() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error ==  nil else {
                print(#function + " API failed")
                
                self?.presenter?.interactorDidFetchUser(with: .failure(APIError.failed(error?.localizedDescription)))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUser(with: .success(users))
                
            } catch {
                self?.presenter?.interactorDidFetchUser(with: .failure(error))
            }
            
            
        }
        
        task.resume()
    }

    
}
