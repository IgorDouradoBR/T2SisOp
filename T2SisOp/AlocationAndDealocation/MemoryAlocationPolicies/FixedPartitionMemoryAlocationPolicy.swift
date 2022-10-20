//
//  FixedPartitionMemoryAlocationPolicy.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation


class FixedPartitionMemoryAlocationPolicy : MemoryAlocationPolicy {

    private let partitionSize:Int
    private let firstFitClass = FirstFitMemoryAlocationPolicy()

    init(partitionSize:Int) {
        self.partitionSize = partitionSize
    }

    func IN(processName: String, processSize: Int, memory: inout [(Bool, String?)]) {
        var processBlockTotalSize = processSize
        let internalFragmentation = (processSize%partitionSize)
        if internalFragmentation > 0 {
            let internalFragmentation: Int = partitionSize - (internalFragmentation)
            processBlockTotalSize = processSize + internalFragmentation
        }


        var freeSlothsFound: Int = 0
        var freeSlothsFoundIndexes: [Int] = []
        var allowedToAllocate: Bool = false

        for (index, memoryLine) in memory.enumerated() {

            if memoryLine.0 == false && memoryLine.1 == nil {
                freeSlothsFound += 1
                freeSlothsFoundIndexes.append(index)
            } else {
                freeSlothsFound = 0
                freeSlothsFoundIndexes = []
            }
            if freeSlothsFound == processBlockTotalSize {
                allowedToAllocate = true
                break
            }
        }
        if allowedToAllocate {
            for (index, memoryLineNumber) in freeSlothsFoundIndexes.enumerated() {
                if index < processSize {
                memory[memoryLineNumber] = (true, processName)
                } else {
                    memory[memoryLineNumber] = (false, processName)
                }
            }

        } else {
            print("ESPAÇO INSUFICIENTE DE MEMÓRIA")

        }


        

    }

}
