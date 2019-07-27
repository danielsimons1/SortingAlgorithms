import UIKit

// Merge Sort
// Split the list into single item arrays
// Then two lists are merged until there is only one list left

// left and right will always be sorted arrays
func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    
    var mergedArray: [T] = []
    var mutableLeft = left
    var mutableRight = right
    
    while mutableLeft.count > 0 && mutableRight.count > 0 {
        if mutableLeft.first! < mutableRight.first! {
            mergedArray.append(mutableLeft.removeFirst())
        } else {
            mergedArray.append(mutableRight.removeFirst())
        }
    }
    
    return mergedArray + mutableLeft + mutableRight
}
    

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    let leftArray = Array(array[0..<(array.count / 2)])
    let rightArray = Array(array[(array.count / 2)..<array.count])
    
    return merge(left: mergeSort(leftArray), right: mergeSort(rightArray))
}


var unsortedArray = [6, 2, 4, 5, 3, 2, 8]
let sortedArray = mergeSort(unsortedArray)
print(sortedArray)
