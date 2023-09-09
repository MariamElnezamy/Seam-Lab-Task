//
//  HomeRepository.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//
import Network
import Combine
import CoreData

final class HomeRepository: DisposeObject, HomeRepositoryProtocol {
    
    // MARK: - PROPERTIES
    private let service: HomeServiceProtocol
    
    // MARK: - INIT
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
        super.init()
    }
    
    // MARK: - REPOSITORIES METHODS
    func getHome() -> AnyPublisher<HomeModel, NetworkError> {
        
        if Reachability.isConnectedToNetwork(){
            return service.getHome()
        }else{
            return convertModel()
        }
        
    }
    
    func convertModel() -> AnyPublisher<HomeModel, NetworkError> {
        print("===========")
        let model = Future<HomeModel, NetworkError> { promis in
            
            let managedObjects: [NSManagedObject] = CoreDataHandler.shared.fetchAllRecords()
            
            let items: [Articles] = managedObjects.map { item in
                guard let title = item.value(forKey: "title") as? String else {return nil}
                guard let author = item.value(forKey: "author") as? String else {return nil}
                guard let description = item.value(forKey: "descriptionHome") as? String else {return nil}
                guard let url = item.value(forKey: "url") as? String else {return nil}
                guard let urlToImage = item.value(forKey: "urlToImage") as? String else {return nil}
                guard let publishedAt = item.value(forKey: "publishedAt") as? String else {return nil}
                guard let content = item.value(forKey: "content") as? String else {return nil}
                
                return Articles(source: nil,
                                author: author,
                                title: title,
                                description: description,
                                url: url,
                                urlToImage: urlToImage,
                                publishedAt: publishedAt,
                                content: content)
            }.compactMap({$0})
            
            let homeModel = HomeModel(status: "", totalResults: items.count, articles: items)
            promis(.success(homeModel))
            print(items)
            print("==========")
            
        }.eraseToAnyPublisher()
        return model
    }
    
}
