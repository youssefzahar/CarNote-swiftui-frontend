//
//  EntretienDetail.swift
//  carNote
//
//  Created by Apple Esprit on 24/12/2022.
//

import SwiftUI

struct EntretienDetail: View {
    var entretien: Entretien
    @ObservedObject var viewModel = EntretienViewModel()
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Image("logo")
                .resizable()
                .aspectRatio(1,contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
            
            
            HStack{
                Text("Title : ")
                    .font(.title)
                    .fontWeight(.bold)
                Text(entretien.title)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            //                Rating
            HStack{
                Text("Description :")
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                Text(entretien.description!)
                    .lineSpacing(8.0)
                    .opacity(0.6)
            }
        }
    }
}
struct EntretienDetail_Previews: PreviewProvider {
    static var previews: some View {
        EntretienDetail(entretien : entretienList[0])
    }
}
