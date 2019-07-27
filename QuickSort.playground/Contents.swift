import UIKit

var unsortedArray = [6, 2, 4, 5, 3, 2, 8]

// start with the last element as the pivot
// partition the array such that all items less than the pivot are on the left
// and all items greater than the pivot are on the right
// do this until the startIndex is greater than or equal to endIndex
func quickSort<T: Comparable>(_ array: inout [T], startIndex: Int, endIndex: Int) {
    
    if startIndex >= endIndex {
        return
    }
    
    let partitionIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
    quickSort(&array, startIndex: startIndex, endIndex: partitionIndex - 1)
    quickSort(&array, startIndex: partitionIndex + 1, endIndex: endIndex)
}

func partition<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
    
    var partition = startIndex
    
    for index in startIndex..<endIndex {
        
        // compare all items to the end of the array
        if array[index] < array[endIndex] {
            array.swapAt(partition, index)
            partition += 1
        }
    }
    
    array.swapAt(partition, endIndex)
    
    return partition
}

quickSort(&unsortedArray, startIndex: 0, endIndex: unsortedArray.count - 1)

print(unsortedArray)

