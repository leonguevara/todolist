//
//  SecondViewController.swift
//  To Do List
//
//  Created by León Felipe Guevara Chávez on 2016-02-09.
//  Copyright © 2016 León Felipe Guevara Chávez. All rights reserved.
//

import UIKit


// Esta clase controla la segunda vista del programa (la que permite agregar tareas a la lista)
class SecondViewController: UIViewController {

    // Este IBOutlet me permite manejar el campo de texto (entrada de datos del usuario) por medio
    // de código.
    @IBOutlet weak var tareaNueva: UITextField!
    
    
    // Esta función se llama la primera vez que se carga a memoria el controldor; es decir
    // se carga cuando se abre la aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Esta función no la toqué para nada
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Este IBAction está asociado con el botón "Agregar tarea" y me permite, como su nombre lo indica,
    // agregar lo que el usuario metió en el campo de texto como una tarea a mi lista de tareas
    @IBAction func agregarTarea(sender: AnyObject) {
        toDoList.append(tareaNueva.text!)  // Agrega la tarea a la lista
        tareaNueva.text = ""               // Limpia el campo de texto
        
        // Actualizamos en la colección permanente de datos nuestra lista de tares, de manera que aunque
        // cerremos la aplicación, la próxima vez que la abramos veamos la lista que ya generamos y no
        // comencemos desde cero
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    
    // Esta función me permite ocultar el teclado una vez que toco mi pantalla fuera del campo de texto.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Esta función también me ayuda a ocultar el teclado
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        tareaNueva.resignFirstResponder()
        return true
    }
}

