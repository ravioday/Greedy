//
//  HuffmanController.swift
//  GreedyApp
//
//  Created by Ravi Joshi on 9/13/15.
//  Copyright (c) 2015 xogrp. All rights reserved.
//

import UIKit

// Given a set of symbols with their frequenices, write an algortithm to find the smallest average code length for a given piece of text.

// Steps involved in solving the problem

// Building a huffman tree.
// Travering the tree to find a variable length code for each symbol

class HuffmanController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var symbolsFrequenceArray = [[12 : "c"] , [45 : "f"], [9 : "b"], [13 : "d"], [5 : "a"], [16 : "e"]]
        
        // Sort the symbols in an increasing order of frequenices of those symbols.
        sortInputSymbols(&symbolsFrequenceArray)
        
        // Building a huffman tree.
        buildHuffmanTree(symbolsFrequenceArray)
        
        
    }

    private func sortInputSymbols(inout symbolsArray: [Dictionary<Int, String>]) {
        symbolsArray.sort { (dict1: Dictionary<Int, String>, dict2: Dictionary<Int, String>) -> Bool in
            return dict1.keys.first < dict2.keys.first
        }
    }
    
    private func buildHuffmanTree(symbolsArray: [Dictionary <Int, String>]) {
        // Create a Min Heap.
        let minHeap = createMinHeap(symbolsArray)
        
        // Extract two minimums and create another node based on the sum of the 2 frequencies and add it back to the min heap.
        
    }
    
    private func assignCodesInHuffmanTree() {
    
    }
    
    // MARK: Helper Methods
    
    private func createMinHeap(symbolsArray: [Dictionary <Int, String>]) -> MinHeap {
        // Create a Tree
        var minHeap = MinHeap(size: symbolsArray.count, capacity: symbolsArray.count, minHeapArray: [])
        
        for symbol: Dictionary<Int, String> in symbolsArray {
            // Create a new node for each symbol type 
            var minHeapNode = MinHeapNode()
            minHeapNode.frequency = symbol.keys.first
            minHeapNode.symbol = symbol.values.first
            
            minHeap.minHeapArray.append(minHeapNode)
        }
        
        // Build a heap out of that tree
        for var i = minHeap.size - 1 / 2 ; i >= 0; i-- {
            // Call Min-Heapify for each and every node to ensure that the heap is now a minimum heap which means the parent node is always smaller than the child
            minHeapify(minHeap, index: i)
        }

        return minHeap
    }
    
    private func minHeapify(var heap: MinHeap, index: Int) {
        // Standard min heap logic 
        
        
        // At the end of this methods, it will modify the heapyArrayProperty of the heap struct to contain the smallest item at index 0 of the arrat which will correspond to the root of the array
    }
    
    private func extractMinimunFromHeap(var heap: MinHeap) -> MinHeapNode {
        let tempMinimumNode = heap.minHeapArray[0]
        heap.minHeapArray[0] = heap.minHeapArray[heap.size - 1]
        heap.size--
        minHeapify(heap, index: 0)
        return tempMinimumNode
    }
    
}

// MARK: Helper Structs

class MinHeapNode: NSObject {
    var frequency: Int?
    var symbol: String?
    var leftNode: MinHeapNode?
    var rigthNode: MinHeapNode?
    
    override init() {
        super.init()
    }
}

struct MinHeap {
    var size: Int
    var capacity: Int
    var minHeapArray: [MinHeapNode]
}
