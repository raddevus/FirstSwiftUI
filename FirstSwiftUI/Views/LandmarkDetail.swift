//
//  LandmarkDetail.swift
//  FirstSwiftUI
//
//  Created by roger deutsch on 6/23/23.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
            Button(action: {print("clicked the CIRCLE image \(landmark.name)")}){
                CircleImage(image: landmark.image)
                    .offset(y:-130)
                    .padding(.bottom, -130)
                    .zIndex(5000)
            }
            VStack{
                Button(action:
                        {print("This is the other one!")})
                {
                    VStack (alignment: .leading){
                        Text(landmark.name)
                            .font(.title2)
                        .foregroundColor(.green)
                        HStack {
                            Text(landmark.park)
                            Spacer()
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        Divider()
                        Text("About \(landmark.name)")
                        Text(landmark.description)
                    }.padding()
                    
                }
                
            }.padding()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark:landmarks[5])
    }
}
