//
//  ShowProduct.swift
//  carNote
//
//  Created by youssef-mariem on 28/11/2022.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI
import SwiftyJSON

struct ShowProduct: View {
    @ObservedObject var obs = Observer()

    var body: some View {
        NavigationView{
            List(obs.datas){
                i in card(title: i.title, image: i.image, description: i.description)
            }.navigationTitle("Products")
        }
    }
}

struct ShowProduct_Previews: PreviewProvider {
    static var previews: some View {
        ShowProduct()
    }
}

class Observer : ObservableObject {
    @Published var datas = [datatype]()
    init(){
        AF.request("http://172.17.5.23:3000/api/product").responseData {
            (data) in
            let json = try! JSON(data: data.data!)
            for i in json ["response"] {
                self.datas.append(datatype(id: i.1["_id"].stringValue, title: i.1["title"].stringValue, image: i.1["image"].stringValue, description: i.1["description"].stringValue))
                print(i.1)
            }
            //print("1")
        }
        //print("2")
    }
}

struct datatype : Identifiable{
    var id : String
    var title : String
    var image : String
    var description : String
}

struct card : View {
    
    var title = ""
    var image = ""
    var description = ""
    var body: some View {
        
        HStack {
            /*AnimatedImage(image: URL(string: image)!).resizable().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 20)*/
            
            
            Text(title).fontWeight(.heavy)
            Text(description).fontWeight(.heavy)

        }
        
    }
    
    
    
}
