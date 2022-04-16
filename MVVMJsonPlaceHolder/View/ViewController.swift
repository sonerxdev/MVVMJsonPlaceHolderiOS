//
//  ViewController.swift
//  MVVMJsonPlaceHolder
//
//  Created by Soner Karaevli on 16.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var postListViewModel: PostListViewModel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
       getData()

    }
    
    func getData(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        PostService().getPosts(url: url) { posts in
            if let posts = posts {
                self.postListViewModel = PostListViewModel(postList: posts)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel == nil ? 0 : self.postListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let postViewModel = self.postListViewModel.postAtIndex(indexPath.row)
        
        cell.idTxt.text = String(postViewModel.id)
        cell.titleTxt.text = postViewModel.title
        
        return cell
        
    }


}

