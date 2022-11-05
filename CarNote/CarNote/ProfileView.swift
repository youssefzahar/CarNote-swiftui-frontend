//
//  ProfileView.swift
//  CarNote
//
//  Created by Mac2021 on 5/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.blue

        VStack {
            HStack{
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).clipShape(Circle()).clipped().padding(.bottom)
                
                Spacer()
            }
            HStack{
                Spacer()
                Text("First Name").foregroundColor(.white).font(.title).padding()
                Text("Last Name").foregroundColor(.white).font(.title).padding()
                Spacer()
            }
            Text("Cin").foregroundColor(.white).font(.title).padding()
            Text("Phone Number").foregroundColor(.white).font(.title).padding()
            Text("Email").foregroundColor(.white).font(.title).padding()
            
            Text("Role").foregroundColor(.white).font(.title).padding()


        }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
