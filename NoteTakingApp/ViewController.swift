//
//  ViewController.swift
//  NoteTakingApp
//
//  Created by Noah Carpenter on 2024-11-04.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {


    var notes: [Note] = []
    
    
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //reference to core Data context, allowing us to interact with Core Data
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        fetchNotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchNotes()
        tableView.reloadData()
    }

    func fetchNotes(){ // fetch all saved notes from Core Data
        let request: NSFetchRequest<Note> = Note.fetchRequest() // create fetch request for note
        do{
            notes = try context.fetch(request)
        } catch{
            print("Error fetching notes: \(error)")
        }
        
    }
    
    func saveNote(title: String){  //save a note to Core Data
        let newNote = Note(context: context) // create a new note object
        newNote.title = title // set the title
        newNote.dateCreated = Date()
        
        do {
            try context.save() // save the new note to core Data
        } catch{
            print("error saving note \(error)")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count // return the number of notes to display in the table view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //configuring each cell to display the note's title and formatted date
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")
        
        //retrive the note for the current row
        let note = notes[indexPath.row]
        
        // set the cell text with the note title and formatted date
        cell?.textLabel?.text = note.title
        cell?.detailTextLabel?.text = DateFormatter.localizedString(from: note.dateCreated ?? Date(), dateStyle: .short, timeStyle: .none)
        return cell!
    }
    
    
    @IBAction func saveNotesButtonPressed(_ sender: UIButton) {
        guard let title = noteTextField.text, !title.isEmpty else {return}
        //prevent user from submitting an empty text
        // save the note to core data
        saveNote(title:  title)
        // fetch the ntoes
        fetchNotes()
        tableView.reloadData()
        
        //clear the textfield after submission
        noteTextField.text = ""
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete {
            let noteToDelete = notes [indexPath.row] // get the note to delete
            context.delete(noteToDelete) // remove note from core Data
            notes.remove(at: indexPath.row) // removes note from array
            
            do {
                try context.save() // save context after deletion
                
            } catch{
                print("Error deleting note: \(error)")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    

}

