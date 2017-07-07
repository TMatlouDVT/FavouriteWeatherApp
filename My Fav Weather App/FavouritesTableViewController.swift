
import UIKit

class FavouritesTableViewController: UITableViewController {

    var favs: [Favorites] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    
        tableView.register(Cell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(TheHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.sectionHeaderHeight = 55
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
    }
    
    func getData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            
            favs = try context.fetch(Favorites.fetchRequest())
            print(favs)
            print("We went through get data")
            
        }catch {
            
            print("Fetching failed")
            
        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if favs != [] {
        
          return favs.count
        
        }else{
        
          return 0
            
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! Cell
        
        
        cell.city.text = favs[indexPath.row].cityNames
        cell.tableViewController = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")
    }
    
    func deleteCell(cell: UITableViewCell){
    
        if let diP = tableView.indexPath(for: cell){
        
           
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            do{
                
                context.delete(favs[diP.row])
                favs.remove(at: diP.row)
                
                do {
                
                    try context.save()
                
                }catch{
                
                }
                
            }catch {
                
                print("Fetching failed")
                
            }
            
            tableView.deleteRows(at: [diP], with: .automatic)
            
            tableView.reloadData()            
        }
    }


}

class TheHeader: UITableViewHeaderFooterView {

    let header: UILabel = {
    
        let hdr = UILabel()
        hdr.translatesAutoresizingMaskIntoConstraints = false
        hdr.textColor = .red
        hdr.text = "My Favourite Cities"
        hdr.textAlignment = NSTextAlignment.center
        
        return hdr
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
    
        addSubview(header)
        
        header.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        header.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        header.widthAnchor.constraint(equalToConstant: 345).isActive = true
    
    }
    
}
