//
//  showProductUIView.swift
//  carNote
//
//  Created by youssef-mariem on 7/12/2022.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI
import SwiftyJSON

struct ShowProductUIView: View {
    @ObservedObject var obs = Observer()
   

    var body: some View {
        NavigationView{

        
            List(obs.datas){
                i in
                NavigationLink(destination:DetailProduct()){
                    //DetailProduct(productItem: i)
                label: do {
                    card(title: i.title, image: i.image, description: i.description, prix: i.prix)
                    }
                    
                    
                }
                
            }.navigationTitle("Products")
        }
    }
}


struct ShowProductUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShowProductUIView()
    }
}

class Observer : ObservableObject {
    @Published var datas = [datatype]()
    init(){
        AF.request("http://172.17.8.0:3000/api/product").responseData {
            (data) in
            let json = try! JSON(data: data.data!)
            for i in json ["response"] {
                self.datas.append(datatype(id: i.1["_id"].stringValue, title: i.1["title"].stringValue, image: i.1["image"].stringValue, description: i.1["description"].stringValue, prix: i.1["prix"].intValue))
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
    var prix : Int
}

struct card : View {
    
    var title = ""
    var image = ""
    var description = ""
    var prix = 0
    var body: some View {
        
        
        /*AnimatedImage(image: URL(string: image)!).resizable().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 20)*/
        
        
        /* Text(title).fontWeight(.heavy)
         Text(description).fontWeight(.heavy)
         Text("\(prix)DT")*/
        
        
        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottom){
                
                VStack(alignment: .leading){
                    Image("P5")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                    Text(title)
                        .bold()
                    Text(description)
                    Text("\(prix)DT")
                }
                .padding()
                .frame(width: 180 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius:20)
            
            Button{
                
                
            }label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(50)
                    .padding()
                
                
            }
            
          
            
            
            
            
            
            
            
            
            
        }
        
        
        
    }
}
