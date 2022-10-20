//
//  StandardMemoryDealocationPolicy.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation

class StandardMemoryDealocationPolicy: MemoryDealocationPolicy {

    func OUT(processName: String, memory: inout [(Bool, String?)]) {
        for (index, lineOfMemory) in memory.enumerated() {
            if lineOfMemory.1 == processName {
                memory[index] = (false, nil)
            }
        }
    }

}
