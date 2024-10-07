//
//  APIManager.swift
//  WayAirLines
//
//  Created by Gabriel Eduardo on 07/10/24.
//

import SwiftUI

/// Mock do URLSession
class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {
        // Aqui iniciaria a chamada de rede, mas não vai fazer nada.
    }
}

class MockURLSession: URLSession {
    var nextData: Data? // Armazena dados simulados
    var nextError: Error? // Armazena erros

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(nextData, nil, nextError)
        return MockURLSessionDataTask()
    }
}

class APIManager: ObservableObject {
    private var session: URLSession
    
    init() {
        
        let mock = MockURLSession()
        
        // Dados simulados
        let jsonString = """
            {
              "flights": [
                {
                  "flight_id": "AB123",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-08-01",
                  "end_date": "2024-08-01",
                  "departure_time": "10:00",
                  "arrival_time": "14:00",
                  "departure_airport": "JFK - John F. Kennedy International Airport",
                  "arrival_airport": "LAX - Los Angeles International Airport",
                  "airplane_name": "Boeing 737"
                },
                {
                  "flight_id": "CD456",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-08-03",
                  "end_date": "2024-08-03",
                  "departure_time": "15:30",
                  "arrival_time": "19:45",
                  "departure_airport": "ORD - O'Hare International Airport",
                  "arrival_airport": "MIA - Miami International Airport",
                  "airplane_name": "Airbus A320"
                },
                {
                  "flight_id": "EF789",
                  "status": "CANCELADO",
                  "completion_status": "CANCELADO",
                  "start_date": "2024-08-05",
                  "end_date": "2024-08-05",
                  "departure_time": "08:00",
                  "arrival_time": "11:30",
                  "departure_airport": "SFO - San Francisco International Airport",
                  "arrival_airport": "SEA - Seattle-Tacoma International Airport",
                  "airplane_name": "Boeing 747"
                },
                {
                  "flight_id": "GH012",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-08-07",
                  "end_date": "2024-08-07",
                  "departure_time": "09:45",
                  "arrival_time": "13:30",
                  "departure_airport": "ATL - Hartsfield-Jackson Atlanta International Airport",
                  "arrival_airport": "DFW - Dallas/Fort Worth International Airport",
                  "airplane_name": "Boeing 777"
                },
                {
                  "flight_id": "IJ345",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-08-09",
                  "end_date": "2024-08-09",
                  "departure_time": "12:00",
                  "arrival_time": "16:15",
                  "departure_airport": "BOS - Logan International Airport",
                  "arrival_airport": "LAX - Los Angeles International Airport",
                  "airplane_name": "Airbus A380"
                },
                {
                  "flight_id": "KL678",
                  "status": "CANCELADO",
                  "completion_status": "CANCELADO",
                  "start_date": "2024-08-11",
                  "end_date": "2024-08-11",
                  "departure_time": "11:30",
                  "arrival_time": "14:50",
                  "departure_airport": "MIA - Miami International Airport",
                  "arrival_airport": "JFK - John F. Kennedy International Airport",
                  "airplane_name": "Boeing 737"
                },
                {
                  "flight_id": "MN901",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-08-13",
                  "end_date": "2024-08-13",
                  "departure_time": "06:00",
                  "arrival_time": "09:30",
                  "departure_airport": "LAX - Los Angeles International Airport",
                  "arrival_airport": "SFO - San Francisco International Airport",
                  "airplane_name": "Airbus A320"
                },
                {
                  "flight_id": "OP234",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-08-15",
                  "end_date": "2024-08-15",
                  "departure_time": "14:00",
                  "arrival_time": "18:30",
                  "departure_airport": "SEA - Seattle-Tacoma International Airport",
                  "arrival_airport": "ORD - O'Hare International Airport",
                  "airplane_name": "Boeing 777"
                },
                {
                  "flight_id": "QR567",
                  "status": "CANCELADO",
                  "completion_status": "CANCELADO",
                  "start_date": "2024-08-17",
                  "end_date": "2024-08-17",
                  "departure_time": "10:30",
                  "arrival_time": "13:45",
                  "departure_airport": "DFW - Dallas/Fort Worth International Airport",
                  "arrival_airport": "ATL - Hartsfield-Jackson Atlanta International Airport",
                  "airplane_name": "Boeing 747"
                },
                {
                  "flight_id": "ST890",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-08-19",
                  "end_date": "2024-08-19",
                  "departure_time": "17:00",
                  "arrival_time": "20:45",
                  "departure_airport": "LGA - LaGuardia Airport",
                  "arrival_airport": "MIA - Miami International Airport",
                  "airplane_name": "Airbus A380"
                },
                {
                  "flight_id": "UV123",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-08-21",
                  "end_date": "2024-08-21",
                  "departure_time": "08:30",
                  "arrival_time": "12:15",
                  "departure_airport": "ORD - O'Hare International Airport",
                  "arrival_airport": "DFW - Dallas/Fort Worth International Airport",
                  "airplane_name": "Boeing 737"
                },
                {
                  "flight_id": "WX456",
                  "status": "CANCELADO",
                  "completion_status": "CANCELADO",
                  "start_date": "2024-08-23",
                  "end_date": "2024-08-23",
                  "departure_time": "16:00",
                  "arrival_time": "19:30",
                  "departure_airport": "SFO - San Francisco International Airport",
                  "arrival_airport": "JFK - John F. Kennedy International Airport",
                  "airplane_name": "Airbus A320"
                },
                {
                  "flight_id": "YZ789",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-08-25",
                  "end_date": "2024-08-25",
                  "departure_time": "11:00",
                  "arrival_time": "14:45",
                  "departure_airport": "ATL - Hartsfield-Jackson Atlanta International Airport",
                  "arrival_airport": "LAX - Los Angeles International Airport",
                  "airplane_name": "Boeing 777"
                },
                {
                  "flight_id": "AB987",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-08-27",
                  "end_date": "2024-08-27",
                  "departure_time": "09:00",
                  "arrival_time": "12:30",
                  "departure_airport": "SEA - Seattle-Tacoma International Airport",
                  "arrival_airport": "ORD - O'Hare International Airport",
                  "airplane_name": "Boeing 747"
                },
                {
                  "flight_id": "CD654",
                  "status": "CANCELADO",
                  "completion_status": "CANCELADO",
                  "start_date": "2024-08-29",
                  "end_date": "2024-08-29",
                  "departure_time": "13:00",
                  "arrival_time": "16:45",
                  "departure_airport": "JFK - John F. Kennedy International Airport",
                  "arrival_airport": "MIA - Miami International Airport",
                  "airplane_name": "Airbus A320"
                },
                {
                  "flight_id": "EF321",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-08-31",
                  "end_date": "2024-08-31",
                  "departure_time": "07:30",
                  "arrival_time": "10:45",
                  "departure_airport": "LAX - Los Angeles International Airport",
                  "arrival_airport": "DFW - Dallas/Fort Worth International Airport",
                  "airplane_name": "Boeing 737"
                },
                {
                  "flight_id": "GH098",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-09-02",
                  "end_date": "2024-09-02",
                  "departure_time": "12:15",
                  "arrival_time": "15:45",
                  "departure_airport": "ORD - O'Hare International Airport",
                  "arrival_airport": "SEA - Seattle-Tacoma International Airport",
                  "airplane_name": "Airbus A380"
                },
                {
                  "flight_id": "IJ765",
                  "status": "CANCELADO",
                  "completion_status": "CANCELADO",
                  "start_date": "2024-09-04",
                  "end_date": "2024-09-04",
                  "departure_time": "18:00",
                  "arrival_time": "21:45",
                  "departure_airport": "MIA - Miami International Airport",
                  "arrival_airport": "LAX - Los Angeles International Airport",
                  "airplane_name": "Boeing 747"
                },
                {
                  "flight_id": "KL432",
                  "status": "CONCLUIDO",
                  "completion_status": "ATRASOU",
                  "start_date": "2024-09-06",
                  "end_date": "2024-09-06",
                  "departure_time": "13:30",
                  "arrival_time": "17:15",
                  "departure_airport": "JFK - John F. Kennedy International Airport",
                  "arrival_airport": "ORD - O'Hare International Airport",
                  "airplane_name": "Boeing 737"
                },
                {
                  "flight_id": "MN109",
                  "status": "CONCLUIDO",
                  "completion_status": "NO_HORARIO",
                  "start_date": "2024-09-08",
                  "end_date": "2024-09-08",
                  "departure_time": "05:45",
                  "arrival_time": "09:00",
                  "departure_airport": "LAX - Los Angeles International Airport",
                  "arrival_airport": "ATL - Hartsfield-Jackson Atlanta International Airport",
                  "airplane_name": "Airbus A320"
                }
              ]
            }
        """
        
        // Passando os dados simulados para o mock
        mock.nextData = jsonString.data(using: .utf8)
        
        self.session = mock
    }
    
    func fetchFlights(completion: @escaping (Result<[Flight], Error>) -> Void, filter: String = "USDT") {
        // Configurando a URL
        let urlString = "https://url.ficticia.so.para.testar/api/flights"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        // Criando a task para chamada da API
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Salvando os dados. Se não der certo, ele retorna um erro.
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            // Decodificando os dados. Se não der certo, ele retorna um erro.
            do {
                // A resposta chega como uma propriedade chamada products que armazena os filmes
                let decodedResponse = try JSONDecoder().decode(FlightsResponse.self, from: data)
                // Array de filmes
                completion(.success(decodedResponse.flights))
            } catch {
                completion(.failure(error))
            }
        }
        
        // Inicia a task para chamar a API.
        task.resume()
    }
}

struct FlightsResponse: Codable {
    let flights: [Flight]
}
