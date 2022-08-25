//
//  Post.swift
//  RestAPI
//
//  Created by Muhammad Fikri Hadian on 21/08/22.
//

import Foundation
import SwiftUI

struct Post : Codable, Identifiable{
    public var id : Int
    public var title : String
    public var body : String
}
