//
//  DateEntretienUIView.swift
//  carNote
//
//  Created by youssef-mariem on 21/11/2022.
//

import SwiftUI

struct DateEntretienUIView: View {
  //  @State private var date = Date()
    @ObservedObject var viewModel = EntretienViewModel()
    @State private var title=""
    @State private var description=""
    @State private var date = Date()



    var body: some View {
        
        VStack{
            Text("Pick a Date !").font(.system(size: 34, design: .rounded)).bold().padding().foregroundColor(.white)
            
            Spacer()
            HStack{
                Form{
                    
                    
                    
                    DatePicker("Date entretien", selection: $viewModel.date,displayedComponents:[.date] )
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            
            ScrollView{
                HStack{
                    Image(systemName: "car").foregroundColor(.blue)
                        .foregroundColor(.gray).font(.headline)
                    TextField("Title", text: $viewModel.title)
                        .padding()
                    .frame(width: 300, height: 30)}
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                
                HStack{
                    Image(systemName: "car").foregroundColor(.blue)
                        .foregroundColor(.gray).font(.headline)
                    TextField("Description", text: $viewModel.description)
                        .padding()
                    .frame(width: 300, height: 30)}
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                
               // NavigationLink(destination:HomeUser()){
                    Button("Add Entretien",action:{viewModel.AddEntretien(title:viewModel.title, description:viewModel.description, date: viewModel.date)
                        
                    })
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    
                //}
                
                
                
                
            }}}}

struct DateEntretienUIView_Previews: PreviewProvider {
    static var previews: some View {
        DateEntretienUIView()
    }
}
