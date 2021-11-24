//
//  FungiListView.swift
//  FungiFinder
//
//  Created by Mohammad Azam on 11/3/20.
//

import SwiftUI
import UIKit

enum SourceType {
    case photoLibrary
    case camera
}

struct FungiListView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var originalImage: UIImage? = nil
    @State private var name: String = ""
    @State private var showActionSheet: Bool = false
    @State private var sourceType: SourceType = .photoLibrary
    
    var body: some View {
        ZStack {
            Text("Display List of Fungi")
           
        }.navigationTitle("Fungi")
        .navigationBarItems(trailing: Button(action: {
            // show camera
            showActionSheet = true
        }, label: {
            Image(systemName: "camera")
                .font(.title)
        })
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(title: Text("Select"), message: nil, buttons: [
                .default(Text("Photo Library")) {
                    showImagePicker = true
                    sourceType = .photoLibrary
                },
                .default(Text("Camera")) {
                    showImagePicker = true
                    sourceType = .camera
                },
                .cancel()
            ])
        })
        
        
        )
        .sheet(isPresented: $showImagePicker, content: {
            PhotoCaptureView(showImagePicker: $showImagePicker, image: $image, originalImage: $originalImage, sourceType: sourceType)
        })
    .onAppear(perform: {
        
    })
    }
}

struct FungiListView_Previews: PreviewProvider {
    static var previews: some View {
        FungiListView().embedInNavigationView()
    }
}

struct PhotoPreviewView: View {
    
    @Binding var image: Image?
    @Binding var name: String
    let save: () -> Void
    
    var body: some View {
        
        
        ZStack {
            VStack {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                    TextField("Enter name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                    Button("Save") {
                        save()
                        image = nil
                    }.buttonStyle(PrimaryButtonStyle())
            }.padding()
        }.background(Color(#colorLiteral(red: 0.904804647, green: 0.9049565196, blue: 0.904784739, alpha: 1)))
        
        .cornerRadius(10)
        .offset(y: 0)
        .padding()
        
    }
}

struct FungiCell: View {
    
    var body: some View {
        Text("Fungi Cell")
        /*
        VStack {
            URLImage(url: URL(string: fungi.photoUrl)!) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }.clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            
            Text(fungi.name)
                .font(.headline)
        } */
    }
}
