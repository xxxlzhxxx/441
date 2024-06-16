import UIKit

final class ChattTableCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var videoTapped: UIButton!
    @IBOutlet weak var chattImageView: UIImageView!
    
    var playVideo: (() -> Void)?  // a closure
    @IBAction func videoTapped(_ sender: UIButton) {
        self.playVideo?()
    }
}
