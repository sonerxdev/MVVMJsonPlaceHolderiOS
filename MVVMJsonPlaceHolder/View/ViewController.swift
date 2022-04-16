//
//  ViewController.swift
//  MVVMJsonPlaceHolder
//
//  Created by Soner Karaevli on 16.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        PostService().getPosts(url: url) { posts in
            if let posts = posts {
                debugPrint(posts)
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        return cell
        
    }


}

