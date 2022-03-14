//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Maria Alice Rodrigues Fortunato on 08/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var mostrarResultadoView: UIView!
    @IBOutlet weak var resultadoIMCLabel: UILabel!
    @IBOutlet weak var linhaAbaixoPeso: UIStackView!
    @IBOutlet weak var linhaPesoIdeal: UIStackView!
    @IBOutlet weak var linhaSobrepeso: UIStackView!
    @IBOutlet weak var linhaObesidade: UIStackView!
    @IBOutlet weak var fraseIMClabel: UILabel!
    

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldStyle()
    }
    
    // MARK: - IBAction

    @IBAction func calcularButton(_ sender: Any) {
        validarCampos()
    }
    @IBAction func limparTextField(_ sender: Any) {
        alturaTextField.text = ""
        pesoTextField.text = ""
        resultadoIMCLabel.text = ""
    }
    
    // MARK: - Metodos
    
    func validarCampos() {
        if (alturaTextField.text == "" && pesoTextField.text == "") {
            Alerta(controller: self).exibeAlerta(titulo: "Atenção", mensagem: "Preencha os campos corretamente")
        } else {
            calcularIMC()
        }
    }
    func calcularIMC() {
        guard let alturaString = alturaTextField.text else { return }
        guard let pesoString = pesoTextField.text else { return }
        
        // transformar em Float e calcular
        let altura = (alturaString as NSString).floatValue
        let peso = (pesoString as NSString).floatValue
        let imc = peso / (altura*altura)
        
        resultadoIMCLabel.text = "\(imc)%"
        
        if (imc < 18) {
            fraseIMClabel.text = "AbaixoPeso"
        } else if (imc >= 18 && imc < 25) {
            fraseIMClabel.text = "PesoIdeal"
        } else if (imc >= 25 && imc < 30) {
            fraseIMClabel.text = "Sobrepeso"
        } else {
            fraseIMClabel.text = "Obesidade"
        }
        
    }
    func resultadoLinha() {
        guard let fraseImc = fraseIMClabel.text else { return }
        let corBorda = CGColor(red: 4.0/255.0, green: 60.0/255.0, blue: 1.0/255.0, alpha: 0.67)
        
        if (fraseImc == "AbaixoPeso") {
            resultadoIMCLabel.textColor = .red
            linhaAbaixoPeso.layer.borderWidth = 2
            linhaAbaixoPeso.layer.borderColor = corBorda
        } else if (fraseImc == "PesoIdeal") {
            resultadoIMCLabel.textColor = .green
            linhaPesoIdeal.layer.borderWidth = 2
            linhaPesoIdeal.layer.borderColor = corBorda
        } else if (fraseImc == "Sobrepeso") {
            resultadoIMCLabel.textColor = .yellow
            linhaSobrepeso.layer.borderWidth = 2
            linhaSobrepeso.layer.borderColor = corBorda
        } else {
            resultadoIMCLabel.textColor = .red
            linhaObesidade.layer.borderWidth = 2
            linhaObesidade.layer.borderColor = corBorda
        }
    }

    func textFieldStyle() {
        guard let altura = alturaTextField else { return }
        guard let peso = pesoTextField else { return }
        let corBorda = CGColor(red: 4.0/255.0, green: 60.0/255.0, blue: 1.0/255.0, alpha: 0.67)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        let esquerdaView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        
        altura.leftView = leftView
        altura.leftViewMode = .always
        altura.layer.borderWidth = 2
        altura.layer.cornerRadius = 8
        altura.layer.borderColor = corBorda

        peso.leftView = esquerdaView
        peso.leftViewMode = .always
        peso.layer.borderWidth = 2
        peso.layer.cornerRadius = 8
        peso.layer.borderColor = corBorda
        
    }
    
}

