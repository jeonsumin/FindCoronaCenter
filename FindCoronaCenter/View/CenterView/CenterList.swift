//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by Terry on 2022/03/02.
//

import SwiftUI

struct CenterList: View {
    var center = [Center]()
    
    var body: some View {
        List(center, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
        
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .경기도, facilityName: "실내빙상장", address: "경기도 뫄뫄시 뫄뫄구", lat: "34.404475", lng: "126.9491998", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 1, sido: .경기도, facilityName: "실내빙상장", address: "경기도 뫄뫄시 뫄뫄구", lat: "34.404475", lng: "126.9491998", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 2, sido: .경기도, facilityName: "실내빙상장", address: "경기도 뫄뫄시 뫄뫄구", lat: "34.404475", lng: "126.9491998", centerType: .central, phoneNumber: "010-0000-0000")
        ]
        CenterList(center: centers)
    }
}
