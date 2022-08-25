//
//  ContentView.swift
//  RestAPI
//
//  Created by Muhammad Fikri Hadian on 21/08/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = CovidServices()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ForEach(fetch.datatotal){
                        data in
                        HStack(spacing: 10){
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "plus.circle.fill").foregroundColor(Color.white)
                                    Text("Positif").font(.headline).foregroundColor(Color.white)
                                    Text("\(data.jumlah_positif)").font(.headline).foregroundColor(Color.white)
                                }
                                Spacer()
                            }.frame(height: 100).padding().background(Color.red).cornerRadius(20)
                            
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "bed.double.fill").foregroundColor(Color.white)
                                    Text("Dirawat").font(.headline).foregroundColor(Color.white)
                                    Text("\(data.jumlah_dirawat)").font(.headline).foregroundColor(Color.white)
                                }
                                Spacer()
                            }.frame(height: 100).padding().background(Color.green).cornerRadius(20)
                        }
                        
                        HStack(spacing:10){
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "heart.fill").foregroundColor(Color.white)
                                    Text("Sembuh").font(.headline).foregroundColor(Color.white)
                                    Text("\(data.jumlah_sembuh)").font(.headline).foregroundColor(Color.white)
                                }
                                Spacer()
                            }.frame(height: 100).padding().background(Color.blue).cornerRadius(20)
                            
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "waveform.path.ecg").foregroundColor(Color.white)
                                    Text("Meninggal").font(.headline).foregroundColor(Color.white)
                                    Text("\(data.jumlah_meninggal)").font(.headline).foregroundColor(Color.white)
                                }
                                Spacer()
                            }.frame(height: 100).padding().background(Color.black).cornerRadius(20)
                        }
                        Spacer()
                    }
                }.padding()
                
                
                if(fetch.isLoading){
                    VStack{
                        Indicator()
                        Text("Please wait...")
                    }.padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.secondary, radius: 20)
                }
            }
            .navigationBarTitle("PeduliSesama")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StandardJSON : View{
    @ObservedObject var fetch = Services()
    
    var body: some View{
        List(fetch.post){post in
            VStack(alignment: .leading){
                Text(post.title).font(.system(size: 24, weight:.bold, design:.rounded))
                Text(post.body).font(.system(size: 16, weight:.thin, design:.rounded))
                Button(action: {print("Id Post \(post.id)")}){
                    Text("Detail Post")
                }
            }
        }
    }
}

struct Indicator: UIViewRepresentable{
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.green
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        uiView.startAnimating()
    }
}
