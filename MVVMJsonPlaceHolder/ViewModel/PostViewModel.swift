//
//  PostViewModel.swift
//  MVVMJsonPlaceHolder
//
//  Created by Soner Karaevli on 16.04.2022.
//

import Foundation


struct PostListViewModel {
    let postList : [PostModel]
    
   
}

extension PostListViewModel {
    
    func numberOfRowsInSection() -> Int {
        return self.postList.count
    }
    
    func postAtIndex(_ index: Int) -> PostViewModel{
        let post = self.postList[index]
        return PostViewModel(post: post)
        }
}


struct PostViewModel {
    let post : PostModel
}

extension PostViewModel {
    
    var userId : Int {
        return self.post.userId
    }
    var id : Int {
        return self.post.id
    }
    var title : String {
        return self.post.title
    }
    var body : String {
        return self.post.body
    }
}
