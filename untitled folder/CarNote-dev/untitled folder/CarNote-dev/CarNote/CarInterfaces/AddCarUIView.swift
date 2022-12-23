//
//  AddCarUIView.swift
//  carNote
//
//  Created by youssef-mariem on 21/11/2022.
//

import SwiftUI


struct AddCarUIView: View {
    
  /*  struct selectioncarburant {

    }*/
    
    @State private var modele=""
   // @State private var type=""
    //@State private var marque=""
    @State private var immatricule=""
    @State private var puissance=""
    //@Binding public var email :String
    
   // @State private var carburant = ""
    @State private var description=""
    // @State private var ownedBy
    @State private var image=""
    @State private var kilometrage=""
    
    //let carburant = [selectioncarburant].self()
    @State private var type = ""
    @State private var marque = ""

    
 //   @State var selectioncarburant = ["Essence","Gasoil"]
 //   @State var selectiontype = ["Voiture","Moto","Bus"]
 //   @State var selectionmarque = ["Ford","Hyndai","BMW","Volswagen","Mercedes"]


    
    //@State private var image=""
    @ObservedObject var viewModel = CarViewModel()
    
    var body: some View {
        NavigationView {
           
                
                ZStack{
                    LinearGradient(gradient:Gradient(colors: [.blue,.white]), startPoint: .topTrailing, endPoint:.bottomLeading)
                        .ignoresSafeArea(.all)
                    VStackLayout {
                        
                        
                        
                        /*  Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).padding()*/
                        
                        Text("Add New      Car ! ").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.white)
                        
                        
                        ScrollView{
                            VStack (alignment: .leading, spacing:30 ){
                                
                                
                                VStack{
                                    Text("Car Modele  : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-110)
                                    
                                    HStack{
                                        Image(systemName: "car").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("Modele", text: $viewModel.modele)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                }
                                
                                
                                
                                VStack{
                                    Text("Car Type : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-130)
                                    
                                    HStack{
                                        Image(systemName: "car").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("Type", text: $viewModel.type)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                }
                                /*   Picker(selection: $type, label: Text("Type")){
                                 ForEach(0 ..< selectiontype.count ) {
                                 Text(self.selectiontype[$0]).tag($0)
                                 }
                                 
                                 }*/
                                
                                VStack{
                                    Text("Car Marque: ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-120)
                                    
                                    HStack{
                                        Image(systemName: "car").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("Marque", text: $viewModel.marque)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                }
                                /*   Picker(selection: $marque, label: Text("Type")){
                                 ForEach(0 ..< selectionmarque.count ) {
                                 Text(self.selectionmarque[$0]).tag($0)
                                 }
                                 
                                 }*/
                                VStack{
                                    Text("Car Immatricule : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                    
                                    HStack{
                                        Image(systemName: "creditcard.fill").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("Immatricule", text: $viewModel.immatricule)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                    
                                }
                                
                                
                                VStack{
                                    Text("Car Puissance : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                    HStack{
                                        Image(systemName: "bolt").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("Puissance", value: $viewModel.puissance,format: .number)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                }
                                
                                
                                VStack{
                                    Text("Car carburant : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                    HStack{
                                        Image(systemName: "fuelpump.fill").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("carburant", text: $viewModel.carburant)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                }
                                //   Form{
                                //  Section {
                                /*  Picker(selection: $carburant , label: Text("Carburant")){
                                 ForEach(0 ..< selectioncarburant.count ) {
                                 Text(self.selectioncarburant[$0]).tag($0)
                                 }
                                 
                                 }*/
                                //  }
                                //   }.navigationBarTitle(Text("Carburant"))
                                
                                VStack{
                                    Text("Car Description : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                    HStack{
                                        Image(systemName: "text.justify.trailing").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("Description", text: $viewModel.description)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                }
                                
                                VStack{
                                    Text("Car kilometrage : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                    HStack{
                                        Image(systemName: "car").foregroundColor(.blue)
                                            .foregroundColor(.gray).font(.headline)
                                        TextField("kilometrage", value: $viewModel.kilometrage,format:.number)
                                            .padding()
                                        .frame(width: 300, height: 30)}
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                                    
                                    
                                }
                                
                                
                                /*     Button("Upload image"){}
                                 .foregroundColor(.blue)
                                 .frame(width: 300, height: 50)
                                 .background(Color.white)
                                 .cornerRadius(10)*/
                                
                                
                                /*   TextField("image", text: $viewModel.image)
                                 .padding()
                                 .frame(width: 300, height: 50)
                                 .background(Color.black.opacity(0.05))
                                 .cornerRadius(10)*/
                                
                                
                                
                                
                            }
                            
                            NavigationLink(destination:HomeUser()){
                                Button("Add Car",action:{viewModel.AddCar(modele:viewModel.modele, type:viewModel.type, marque:viewModel.marque, immatricule:viewModel.immatricule, puissance:viewModel.puissance, carburant:viewModel.carburant, description: viewModel.description, kilometrage: viewModel.kilometrage) //image:viewModel.image?
                                    
                                })
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                                
                                
                            }

                            
                            
                        }}
                }
            }
            .navigationBarHidden(true)
            
        }
    }




struct AddCarUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddCarUIView()
    }
}