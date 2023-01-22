//
//  EntretienView.swift
//  carNote
//
//  Created by Apple Esprit on 24/12/2022.
//

import SwiftUI

struct EntretienView: View {

    var rows = [GridItem(.flexible())]
    @StateObject var  entretienViewModel = EntretienViewModel()
    @State var entretiens : [Entretien] = []
    @State private var isActive: Bool = false

    let Maintenance  : LocalizedStringKey = "Maintenance"
    let pickdate  : LocalizedStringKey = "Pick Date "

    var body: some View {
        NavigationView{
           /* VStack{
                
                NavigationLink(destination:DateEntretienUIView()) {
                    Text(pickdate)
                }      .foregroundColor(.blue)
                    .frame(width: 100, height: 50)
                    .cornerRadius(10)
                    .offset(x:150,y: -50)
                Image(systemName: "calendar.badge.plus")
                    .foregroundColor(.blue)
                    .offset(x:80,y:-85)
                
                
            }*/
            ScrollView(.vertical){
              /*  NavigationLink(destination:DateEntretienUIView()) {
                    Text(pickdate)
                }      .foregroundColor(.blue)
                    .frame(width: 100, height: 50)
                    .cornerRadius(10)
                    .offset(x:150,y: -50)
                Image(systemName: "calendar.badge.plus")
                    .foregroundColor(.blue)
                    .offset(x:80,y:-85)*/
                LazyVGrid(columns: rows, spacing: 20){
                   /* ForEach(0x1f600...0x1f679, id: \.self) { value in
                                        Text(String(format: "%x", value))
                                        Text(emoji(value))
                                            .font(.largeTitle)
                                    }*/
                    
                    
                    ForEach(0 ..< entretiens.count, id:  \ .self ) {
                        index in
                      //  NavigationLink(destination: EntretienDetail(entretien : entretiens[index])){
                            EntretienUIView(entretien : entretiens[index])
                    //Text("")
                        
                        //}
                        
                    }
                }
                .padding()
            }
            
               .navigationTitle(Text(Maintenance))
            
            
            /*NavigationLink(destination:DateEntretienUIView()) {
                  Text(pickdate)
              }      .foregroundColor(.blue)
                  .frame(width: 100, height: 50)
                  .cornerRadius(10)
                  .offset(x:150,y: -50)
              Image(systemName: "calendar.badge.plus")
                  .foregroundColor(.blue)
                  .offset(x:80,y:-85)*/
            
                .toolbar{
                NavigationLink(isActive: $isActive){
                    DateEntretienUIView()
                } label: {
                    Text(pickdate)
                }
                }
             }.navigationBarHidden(false)
        .onAppear{
            entretienViewModel.GetMyEntretiens {success, result in
                if success {
                    self.entretiens = []
                    self.entretiens.append(contentsOf: result!)
                }
            }
        }
             .navigationViewStyle(StackNavigationViewStyle())
        }
    
    private func emoji(_ value: Int) -> String {
            guard let scalar = UnicodeScalar(value) else { return "?" }
            return String(Character(scalar))
        }
    
}

struct EntretienView_Previews: PreviewProvider {
    static var previews: some View {
        EntretienView()
    }
}
