//
//  Registration.swift
//  CarRegistraion
//
//  Created by Adnann Muratovic on 21.10.21.
//

import Foundation


import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let id: Int
    let registracijskaOznaka: String
    let registrovanoNaOsobuDto: RegistrovanoNaOsobuDto
    let modelVozilaDto: ModelVozilaDto
    let registracija: Registracija
}


// MARK: - ModelVozilaDto
struct ModelVozilaDto: Codable {
    let id: Int
    let model: String
    let godina: Int
    let proizdvodjac: String
    let karakteristikeVozilaDto: KarakteristikeVozilaDto
}

// MARK: - KarakteristikeVozilaDto
struct KarakteristikeVozilaDto: Codable {
    let id, brojSasije: Int
    let boja, tipVozila: String
    let snagaMotora: Int
}

// MARK: - Registracija
struct Registracija: Codable {
    let id: Int
    let trajanjeRegistracijeOd, trajanjeRegistracijeDo: String
    let isteklaRegistracija: Bool
}

// MARK: - RegistrovanoNaOsobuDto
struct RegistrovanoNaOsobuDto: Codable {
    let id: Int
    let ime, prezime: String
    let jmbg: Int
    let datumRodjenja, grad: String
}

typealias Welcome = [WelcomeElement]

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

