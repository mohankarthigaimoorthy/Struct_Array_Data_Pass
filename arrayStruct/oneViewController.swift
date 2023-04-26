//
//  oneViewController.swift
//  arrayStruct
//
//  Created by Mohan K on 20/02/23.
//

import UIKit

struct Task {
    var id : Int
    var taksName : String
    var color : UIColor
    var status : Int
    var priority : Int
}

class mycell : UICollectionViewCell{
    @IBOutlet weak var text1 : UILabel!
    @IBOutlet weak var text2 : UILabel!
    @IBOutlet weak var text3 : UILabel!
}

class oneViewController: UIViewController {
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    var allTasks = [Task(id: 1, taksName: "do", color: .blue, status: 1, priority: 1), Task(id: 2, taksName: "does", color: .darkGray, status: 2, priority: 2), Task(id: 3, taksName: "did", color: .brown, status: 3, priority: 3), Task(id: 4, taksName: "done", color: .lightGray, status: 4, priority: 4)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
task()
        // Do any additional setup after loading the view.
    }
    
    func task ( ){
        myCollection.delegate = self
        myCollection.dataSource = self
        DispatchQueue.main.async {
            self.myCollection.reloadData()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension oneViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! mycell
        cell.text1.text = allTasks[indexPath.item].taksName
        cell.backgroundColor = allTasks[indexPath.item].color
        cell.text2.text = "\(allTasks[indexPath.item].status)"
        cell.text3.text = "\(allTasks[indexPath.item].priority)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "VC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VC"{
            let viewController = segue.destination as! ViewController
            viewController.allTasks = allTasks
        }
    }
}
