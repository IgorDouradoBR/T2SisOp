//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//
import Foundation


print(CommandLine.arguments)
print(ProcessInfo.processInfo.arguments)
print("hello world!")



func main() {


    let memorySize:Int = 16
    let partitionSize: Int = 4

    let instructionsArray: [MemoryInstructions] = [MemoryInstructions.IN("A", 3),MemoryInstructions.IN("B", 2),MemoryInstructions.IN("C", 1), MemoryInstructions.OUT("A"), MemoryInstructions.IN("D", 4), MemoryInstructions.OUT("C"),MemoryInstructions.OUT("B"), MemoryInstructions.OUT("D")]

    let memoryManager = MemoryManager(alocationPolicy: FixedPartitionMemoryAlocationPolicy(partitionSize: partitionSize), memorySize: memorySize)

    var instructions = Queue<MemoryInstructions>(elements: instructionsArray)
    let visualizationHelper = VisualizationHelper()
    while instructions.size > 0 {
        guard let instruction = instructions.dequeue() else {
            continue
        }
        memoryManager.process(instruction: instruction)
        visualizationHelper.printMemoryLineByLine(memory:memoryManager.memory )
    }
}
main()

