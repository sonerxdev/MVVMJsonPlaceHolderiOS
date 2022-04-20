//
//  PostService.swift
//  MVVMJsonPlaceHolder
//
//  Created by Soner Karaevli on 16.04.2022.
//

import Foundation

//escaping: fonksiyon döndürüldükten sonra çağrılan, argüman yollanabilen bir fonks.
class PostService {
    // gelen model bir array olduğu için modeli array içerisinde yazdık.
    func getPosts (url: URL, completion: @escaping ([PostModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
              let postList = try?  JSONDecoder().decode([PostModel].self, from: data)
                
                if let postList = postList {
                    completion(postList)
                }
            }
        }.resume()
        
    }
}
