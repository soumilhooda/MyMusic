//
//  ViewController.swift
//  MyMusic
//
//  Created by Soumil Hooda on 02/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs(){
        songs.append(Song(name: "Chicago Freestyle (Remix)",
                          albumName: "Dark Lane Demo Tapes",
                          artistName: "Drake & Giveon",
                          imageName: "cover1",
                          trackName: "chicagofreestylebyDrake&Giveon"))
        songs.append(Song(name: "Fair Trade (Remix)",
                          albumName: "Certified Lover Boy",
                          artistName: "Drake & Travis Scott",
                          imageName: "cover2",
                          trackName: "fairtradebyDrake&TravisScott"))
        songs.append(Song(name: "I Wonder (Remix)",
                          albumName: "Graduation",
                          artistName: "Kanye West",
                          imageName: "cover3",
                          trackName: "iwonderbyKanyeWest"))
        songs.append(Song(name: "Jungle (Remix)",
                          albumName: "If You're Reading This It's Too Late",
                          artistName: "Drake",
                          imageName: "cover4",
                          trackName: "junglebyDrake"))
        songs.append(Song(name: "Laugh Now Cry Later (Remix)",
                          albumName: "Certified Lover Boy",
                          artistName: "Drake & Lil Durk",
                          imageName: "cover5",
                          trackName: "laughnowcrylaterbyDrake&LilDurk"))
        songs.append(Song(name: "Paris Morton Music (Remix)",
                          albumName: "Care Package",
                          artistName: "Drake",
                          imageName: "cover6",
                          trackName: "parismortonmusicbyDrake"))
        songs.append(Song(name: "Race My Mind (Remix)",
                          albumName: "Certified Lover Boy",
                          artistName: "Drake",
                          imageName: "cover7",
                          trackName: "racemymindbyDrake"))
        songs.append(Song(name: "Thinkin Bout You (Remix)",
                          albumName: "Channel Orange",
                          artistName: "Frank Ocean",
                          imageName: "cover8",
                          trackName: "thinkinboutyoubyFrankOcean"))
        songs.append(Song(name: "Time Flies (Remix)",
                          albumName: "Drake Dark Lane Demo Tapes",
                          artistName: "Drake",
                          imageName: "cover9",
                          trackName: "timefliesbyDrake"))
        songs.append(Song(name: "TSU (Remix)",
                          albumName: "Certified Lover Boy",
                          artistName: "Drake",
                          imageName: "cover10",
                          trackName: "tsubyDrake"))
        
    }

    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else{
                return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}

