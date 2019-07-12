//
//  ArtistController.swift
//  MyConcerts
//
//  Created by Guillaume Djaider Fornari on 29/06/2019.
//  Copyright © 2019 Guillaume Djaider Fornari. All rights reserved.
//

import UIKit

class ArtistController: UIViewController {

    var artist: InfoArtists!
    var infoEvents: [Events]!
    @IBOutlet var artistView: ArtistView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.infoEvents)
        self.artistView.setArtistView(infoArtist: artist)
        // Do any additional setup after loading the view.
    }
}
