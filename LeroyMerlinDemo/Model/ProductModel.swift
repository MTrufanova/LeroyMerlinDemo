//
//  ProductModel.swift
//  LeroyMerlinDemo
//
//  Created by msc on 19.04.2021.
//

import Foundation
import UIKit

struct ProductModel {
    let productImage: UIImage?
    let leftPrice: String?
    let rightPrice: String?
    let productName: String?
}
let rubsht = "₽/шт."
let rubKor = "₽/кор."

class Product {

var recentlyViewed: [ProductModel] = {
let first = ProductModel(productImage: UIImage(named: "ванная"), leftPrice: "118", rightPrice: rubsht, productName: "Средство для акриловых ванн")
let second = ProductModel(productImage: UIImage(named: "дрель"), leftPrice: "7 788", rightPrice: rubsht, productName: "Перфоратор Энерго-Пром")
let third = ProductModel(productImage: UIImage(named: "керамогранит"), leftPrice: "730,", rightPrice: "35 \(rubsht)", productName: "Керамогранит Euroceramika Карвалио 15х60 см")
let four = ProductModel(productImage: UIImage(named: "круг"), leftPrice: "21", rightPrice: rubsht, productName: "Круг отрезной по металлу")
let five = ProductModel(productImage: UIImage(named: "ламинат-1"), leftPrice: "899,", rightPrice: "21 \(rubKor)", productName: "Ламинат Artens «Ленасиа»")
    return [first, second, third, four, five]
}()

let limitedOffer: [ProductModel] = {
let six = ProductModel(productImage: UIImage(named: "ламинат"), leftPrice: "1 519,", rightPrice: "63 \(rubKor)", productName: "Ламинат Tarkett «Хартли» 33 класс")
let seven = ProductModel(productImage: UIImage(named: "люстра"), leftPrice: "5 699", rightPrice: rubsht, productName: "Светильник потолочный Evrosvet")
let eight = ProductModel(productImage: UIImage(named: "обои"), leftPrice: "1 068", rightPrice: rubsht, productName: "Обои флизелиновые Vagnerplast Unplugged, золото")
let nine = ProductModel(productImage: UIImage(systemName: "обои2"), leftPrice: "1 737", rightPrice: rubsht, productName: "Обои флизелиновые Erismann Paradiso серые")
let ten = ProductModel(productImage: UIImage(named: "пена"), leftPrice: "303", rightPrice: rubsht, productName: "Пена монтажная пистолетная 750 мл")
    return [six, seven, eight, nine, ten]
}()


let bestPrice: [ProductModel] = {
let eleven = ProductModel(productImage: UIImage(named: "салфетка"), leftPrice: "122", rightPrice: rubsht, productName: "Салфетка кухонная, 35x50 см, хлопок")
let twelve = ProductModel(productImage: UIImage(named: "стекло"), leftPrice: "112", rightPrice: rubsht, productName: "Очиститель для стёкол и зеркал Clin")
let thirteen = ProductModel(productImage: UIImage(named: "стеллаж"), leftPrice: "3 652", rightPrice: rubsht, productName: "Стеллаж Кабуки 60х201х28 см, ЛДСП, цвет сосна")
let fourteen = ProductModel(productImage: UIImage(named: "уровень"), leftPrice: "9 990", rightPrice: rubsht, productName: "Уровень лазерный Bosch UniversalLevel 360 Set, дальность до 24м")
let fifteen = ProductModel(productImage: UIImage(named: "штукатурка"), leftPrice: "413", rightPrice: rubsht, productName: "Штукатурка гипсовая Knauf 30 кг")
let sixteen = ProductModel(productImage: UIImage(named: "шуруповерт"), leftPrice: "5 107", rightPrice: rubsht, productName: "Дрель-шуруповерт фккумуляторная Bosch 120, B-Lion 2x2 Ач")
    return [eleven, twelve, thirteen, fourteen, fifteen, sixteen]
}()

}
