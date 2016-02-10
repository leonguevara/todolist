//
//  FirstViewController.swift
//  To Do List
//
//  Created by León Felipe Guevara Chávez on 2016-02-09.
//  Copyright © 2016 León Felipe Guevara Chávez. All rights reserved.
//

import UIKit

//Aquí voy a cargar mis tareas
var toDoList = [String] ()  //Esto es un arreglo de cadenas de caracteres (String)


// Esta clase es el controlador de la primera vista (la que tiene la tabla).  Aparte de heredar funciones
// de UIViewController, también hereda funciones de UITableViewDelegate
class FirstViewController: UIViewController, UITableViewDelegate {

    // Este IBOutlet me permite manejar mi tabla por medio de código
    @IBOutlet weak var toDoListTable: UITableView!
    
    // Esta función se llama la primera vez que se carga a memoria el controldor; es decir
    // se carga cuando se abre la aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Recupero lo que se haya quedado guardado en la lista en ocasiones anteriores, si es que
        // algo se quedó registrado.  Para ello, uso el objeto NSUserDefaults.
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    // Esta función no la toqué para nada
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Esta función me sirve para saber cuántos renglones tiene mi tabla.  En este caso, tendrá
    // tantos renglones como elementos tenga el arreglo toDoList.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count  // la propiedad count me dice cuantos elementos tiene el arreglo.
    }
    
    // Esta función ejecuta cada que muestro la pantalla.  En este caso, me va a servir para "refrescar"
    // la información de mi tabla cada vez que regrese a esta vista.
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    
    // Esta función me permite llenar la tabla.  En este caso, usará el contenido del arreglo toDoList
    // para etiquetar los renglones de la tabla.  La propiedad row de indexPath indica qué renglón está
    // siendo actualizado.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    // Esta función me permite borrar reaccionar ante eventos de edición en mi tabla.  En este caso, si
    // el commitEditingStyle es el de borrado (un desplazamiento con el dedo hacia la izquierda sobre
    // el renglón), borraremos el renglón seleccionado y actualizaremos nuestra lista.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            toDoListTable.reloadData()
        }
    }
}












