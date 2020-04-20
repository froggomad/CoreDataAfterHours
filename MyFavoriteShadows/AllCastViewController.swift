//
//  AllCastViewController.swift
//  MyFavoriteShadows
//
//  Created by Kenny on 4/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class AllCastViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let cellID = "APICell"
    let controller = APIController()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let castRep = controller.allCharacters[indexPath.row]

        CastMember(character: castRep.character,
                   actor: castRep.actor,
                   gender: castRep.gender.rawValue,
                   id: castRep.id)
        do {
            try CoreDataStack.shared.save()
        } catch let saveFavoriteCastError {
            print("Error saving Cast member: \(saveFavoriteCastError)", #file, #function, #line)
        }
        
        dismiss(animated: true, completion: nil)
    }
}


//MARK: - tableView DataSource -
extension AllCastViewController: UITableViewDataSource {
    //MARK: Num Sections -
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    //MARK: Num Rows in Section -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controller.allCharacters.count
    }
    //MARK: Cell for row at indexPath -
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = controller.allCharacters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = character.character
        cell.detailTextLabel?.text = character.actor
        return cell
    }
    //MARK: Header View -
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let padding: CGFloat = 8

        // MARK: Setup view
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        //MARK: Label Stack
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.alignment = .fill
        // MARK: Labels
        let charactersLabel = setupLabel(text: "Character")
        let actorsLabel = setupLabel(text: "Actor")
        actorsLabel.textAlignment = .right
        hStack.addArrangedSubview(charactersLabel)
        hStack.addArrangedSubview(actorsLabel)
        view.addSubview(hStack)
        //MARK: Constraints
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            hStack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            hStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            view.heightAnchor.constraint(equalToConstant: 60),
            view.widthAnchor.constraint(equalToConstant: tableView.frame.width - padding*2)
        ])
        return view
    }

    private func setupLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.text = text
        let font = UIFont.systemFont(ofSize: 16, weight: .black)
        label.font = font
        return label
    }

}

