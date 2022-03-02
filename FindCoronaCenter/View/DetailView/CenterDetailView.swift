//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by Terry on 2022/03/02.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(width: .infinity, height: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facilityName: "실내빙상장", address: "경기도 뫄뫄시 뫄뫄구", lat: "34.404475", lng: "126.9491998", centerType: .central, phoneNumber: "010-0000-0000")
        CenterDetailView(center: center0)
    }
}
