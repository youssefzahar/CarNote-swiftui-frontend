//
//  UserTableViewController.swift
//  carNote
//
//  Created by Apple Esprit on 29/12/2022.
//

import UIKit


class CUserTableViewController: UITableViewController {
    private var Users : [User] = []
    @IBOutlet var tableview: UITableView!

     var first_name:String = UserViewModel.currentUser?.first_name ?? ""
    var  last_name:String = UserViewModel.currentUser?.last_name ?? ""
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
        let cell = tableView.dequeueReusableCell(withIdentifier: "celloss")
        let contentView = cell?.contentView

        let imageProfile = contentView?.viewWithTag(1) as! UIImageView
        let labelName = contentView?.viewWithTag(2) as! UILabel
        let labelUsername = contentView?.viewWithTag(3) as! UILabel
        
        let utilisateur = Users[indexPath.row]
        
      
        labelName.text =/* c +*/ " " + first_name
      //  labelName.text = utilisateur.lastName
        labelUsername.text = "@" + last_name
        
    
      /*  imageProfile.load(url:    URL(string: "http://172.17.1.178:5000/img/"+user.image )!)
      */  return cell!
    }
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Users.count
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      MessagerieViewModel.sharedInstance.creerNouvelleConversation(recepteur: Users[indexPath.row]._id) { success, Conversation in
            if (success) {
                self.dismiss(animated: true, completion: nil)
            } else {
               // self.present(Alrt.makeServerErrorAlert(), animated: true)
            }
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        initialize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       // ModalTransitionMediator.instance.sendPopoverDismissed(modelChanged: true)
    }
    
    // METHODS
    func initialize() {
        UserViewModel().GetUsers() { success, utilisateursfromRep in
            if success {
                self.Users = []
                self.Users = utilisateursfromRep!
                print(self.Users)
                self.tableView.reloadData()
            }else {
              //  self.present(Alrt.makeAlert(titre: "Error", message: "Could not load utilisateurs "),animated: true)
            }
        }
    }}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

