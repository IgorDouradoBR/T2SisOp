//
//  MemoryAlocationProtocol.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation

protocol MemoryAlocationPolicy {
    func IN(processName:String, processSize:Int, memory: inout [(Bool,String?)])
}

protocol MemoryDealocationPolicy {
    func OUT(processName:String, memory: inout [(Bool,String?)])
}

