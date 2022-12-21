//
//  CarUIView.swift
//  carNote
//
//  Created by youssef-mariem on 22/11/2022.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI
import SwiftyJSON

struct CarUIView: View {
    @ObservedObject var obscar = ObserverCar()

    var body: some View {
            NavigationView{
                List(obscar.datas){
                    i in cardcar(modele: i.modele, type: i.type, marque: i.marque,  immatricule: i.immatricule, owned_by: i.owned_by)
                }.navigationTitle("My Cars")
            }
        }
}

struct CarUIView_Previews: PreviewProvider {
    static var previews: some View {
        CarUIView()
    }
}




class ObserverCar : ObservableObject {
    @Published var datas = [datatypecar]()
    init(){
        AF.request("http://172.17.1.254:3000/api/car").responseData {
            (data) in
            let json = try! JSON(data: data.data!)
            for i in json ["response"] {
                self.datas.append(datatypecar(id: i.1["_id"].stringValue, modele: i.1["modele"].stringValue, type: i.1["type"].stringValue, marque: i.1["marque"].stringValue, immatricule: i.1["immatricule"].stringValue,owned_by: i.1["owned_by"].stringValue))
                print(i.1)
            }
            //print("1")
        }
        //print("2")
    }
}

struct datatypecar : Identifiable{
    var id : String
    var modele : String
    var type : String
    var marque : String
    var immatricule : String
    var owned_by : String
}

struct cardcar : View {
    
    var modele = ""
    var type = ""
    var marque = ""
    var immatricule = ""
    var owned_by = ""

    var body: some View {
        
       /* HStack {
            /*AnimatedImage(image: URL(string: image)!).resizable().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 20)*/
            VStack{
            
            Text(modele).fontWeight(.heavy)
            Text(type).fontWeight(.heavy)
            Text(marque).fontWeight(.heavy)
            Text(immatricule).fontWeight(.heavy)

            }

        }*/
        
  
    

    ZStack(alignment: .topLeading){
        ZStack(alignment: .bottom){
            
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 250)
                    .scaledToFit()
                Text(modele)
                    .bold()
                Text(type)
                Text(marque)
                Text(immatricule)
                Text(owned_by)

            }
            .padding()
            .frame(width: 280 , alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .frame(width: 400, height: 200)
        .shadow(radius: 3)
        
    }
    
    }
    
    
}
