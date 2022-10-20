//
//  AlocationAndDealocationUnit.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation



class MemoryManager {

    var memory: [(Bool,String?)] 
    var alocationPolicy : MemoryAlocationPolicy
    var dealocationPolicy: MemoryDealocationPolicy

    init(alocationPolicy: MemoryAlocationPolicy,dealocationPolicy: MemoryDealocationPolicy = StandardMemoryDealocationPolicy(), memorySize: Int) {
        self.alocationPolicy = alocationPolicy
        self.dealocationPolicy = dealocationPolicy
        self.memory = []

        if !self.memorySizeIsValid(desiredSize: memorySize ) {
            fatalError("Invalid Memory Size on AlocationAndDealocationUnit")
        }
        self.initMemoryWithNslots(n: memorySize)

    }

    func process(instruction: MemoryInstructions) {
        switch instruction {
        case .IN(let processName, let processSize):
            self.alocationPolicy.IN(processName: processName, processSize: processSize, memory: &memory)

        case .OUT(let processName):
            self.dealocationPolicy.OUT(processName: processName, memory: &memory)
        }
    }

    private func initMemoryWithNslots(n: Int) {
        for _ in Range(0...(n - 1)) {
            self.memory.append((false,nil))
        }
    }

    private func memorySizeIsValid(desiredSize: Int) -> Bool {
        let n = desiredSize
        return (n > 0) && (n & (n - 1) == 0)
    }


}

