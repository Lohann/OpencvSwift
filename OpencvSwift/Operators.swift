//
//  Operators.swift
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

import Foundation

public func + (left:CvMat, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    Cv3.add(left, src2: right, dst: result)
    return result;
}

public func - (left:CvMat, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    Cv3.subtract(left, src2: right, dst: result)
    return result;
}

public func / (left:CvMat, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    Cv3.divide(left, src2: right, dst: result)
    return result;
}

public func * (left:CvMat, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    Cv3.multiply(left, src2: right, dst: result)
    return result;
}


public func + (left:CvMat, right: Double) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.add(left, double: right, result: result)
    return result;
}

public func - (left:CvMat, right: Double) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.subtract(left, double: right, result: result)
    return result;
}

public func / (left:CvMat, right: Double) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.divide(left, double: right, result: result)
    return result;
}

public func * (left:CvMat, right: Double) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.multiply(left, double: right, result: result)
    return result;
}

public func ^ (left:CvMat, right: Double) -> CvMat {
    let result:CvMat = CvMat()
    Cv3.pow(left, power: right, dst:result)
    return result;
}

public func + (left:CvMat, right: Int) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.add(left, int: right, result: result)
    return result;
}

public func - (left:CvMat, right: Int) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.subtract(left, int: right, result: result)
    return result;
}

public func / (left:CvMat, right: Int) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.divide(left, int: right, result: result)
    return result;
}

public func * (left:CvMat, right: Int) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.multiply(left, int: right, result: result)
    return result;
}


public func + (left:Double, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.add(right, double: left, result: result)
    return result;
}

public func - (left:Double, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.subtract(right, double: left, result: result)
    return result;
}

public func / (left:Double, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.divide(right, double: left, result: result)
    return result;
}

public func * (left:Double, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.multiply(right, double: left, result: result)
    return result;
}

public func ^ (left:Double, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    Cv3.pow(right, power: left, dst:result)
    return result;
}

public func + (left:Int, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.add(right, int: left, result: result)
    return result;
}

public func - (left:Int, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.subtract(right, int: left, result: result)
    return result;
}

public func / (left:Int, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.divide(right, int: left, result: result)
    return result;
}

public func * (left:Int, right: CvMat) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.multiply(right, int: left, result: result)
    return result;
}


public func += (left:CvMat, right: CvMat)  {
    Cv3.add(left, src2: right, dst: left)
}

public func -= (left:CvMat, right: CvMat) {
    Cv3.subtract(left, src2: right, dst: left)
}

public func /= (left:CvMat, right: CvMat) {
    Cv3.divide(left, src2: right, dst: left)
}

public func *= (left:CvMat, right: CvMat) {
    Cv3.multiply(left, src2: right, dst: left)
}

public func += (left:CvMat, right: Double)  {
    OperatorsOverloading.addTo(left, double: right)
}

public func -= (left:CvMat, right: Double) {
    OperatorsOverloading.subtractTo(left, double: right)
}

public func /= (left:CvMat, right: Double) {
    OperatorsOverloading.divideTo(left, double: right)
}

public func *= (left:CvMat, right: Double) {
    OperatorsOverloading.multiplyTo(left, double: right)
}

public func += (left:CvMat, right: Int)  {
    OperatorsOverloading.addTo(left, int: right)
}

public func -= (left:CvMat, right: Int) {
    OperatorsOverloading.subtractTo(left, int: right)
}

public func /= (left:CvMat, right: Int) {
    OperatorsOverloading.divideTo(left, int: right)
}

public func *= (left:CvMat, right: Int) {
    OperatorsOverloading.multiplyTo(left, int: right)
}

public func + (left:CvMat, right: [NSNumber]) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.add(left, array: right, result: result)
    return result;
}

public func - (left:CvMat, right: [NSNumber]) -> CvMat {
    let result:CvMat = CvMat()
    OperatorsOverloading.subtract(left, array: right, result: result)
    return result;
}

public func += (left:CvMat, right: [NSNumber])  {
    OperatorsOverloading.addTo(left, array: right)
}

public func -= (left:CvMat, right: [NSNumber]) {
    OperatorsOverloading.subtractTo(left, array: right)
}





