//
//  RecipeAPI.swift
//  
//
//  Created by Влад Калаев on 12.03.2021.
//

import Foundation
import Networking

public protocol RecipeApiServiceProtocol {
    
    func getRecipe(i: String, p: Int?, completion: @escaping ((_ data: RecipeList?,_ error: Error?) -> Void))
}

open class RecipeApiService: RecipeApiServiceProtocol {
    
    /**
     Get Recipe
     
     - parameter i: (query) Ingredient
     - parameter q: (query) Query (optional)
     - parameter p: (query) Paging (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    public func getRecipe(i: String, p: Int?, completion: @escaping ((_ data: RecipeList?,_ error: Error?) -> Void)) {
        self.getRecipeWithRequestBuilder(i: i, p: p).execute(OpenAPIClientAPI.apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    /**
     Get Recipe
     - GET /api/
     - parameter i: (query) Ingredient
     - parameter q: (query) Query (optional)
     - parameter p: (query) Paging (optional)
     - returns: RequestBuilder<RecipeList>
     */
    func getRecipeWithRequestBuilder(i: String, p: Int? = nil) -> RequestBuilder<RecipeList> {
        let path = "/api/"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "i": i.encodeToJSON(),
            "p": p?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<RecipeList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
