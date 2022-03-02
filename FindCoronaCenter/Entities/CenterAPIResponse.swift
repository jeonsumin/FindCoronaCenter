//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by Terry on 2022/03/02.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
