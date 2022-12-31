//
//  EntretienView.swift
//  carNote
//
//  Created by Apple Esprit on 24/12/2022.
//

import SwiftUI

struct EntretienView: View {

    var rows = [GridItem(.adaptive(minimum: 150), spacing: 30)]
    @StateObject var  entretienViewModel = EntretienViewModel()
    @State var entretiens : [Entretien] = []
    var body: some View {
        NavigationView{
            ScrollView(.horizontal){
                LazyHGrid(rows: rows, spacing: 20){
                    ForEach(0 ..< entretiens.count, id:  \ .self ) {
                        index in
                        NavigationLink(destination: EntretienDetail(entretien : entretiens[index])){
                            EntretienUIView(entretien : entretiens[index])

                        }                        }
                }
                .padding()
            }
               .navigationTitle(Text("Entretien"))
             }
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
    
}

struct EntretienView_Previews: PreviewProvider {
    static var previews: some View {
        EntretienView()
    }
}
