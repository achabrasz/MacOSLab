import Foundation

enum MediaType {
    case photo
    case video
}

struct User {
    let username: String
}

class Photo {
    let user: User
    let mediaType: MediaType
    let timestamp: Date
    let numberOfLikes: Int
    
    init(user: User, timestamp: Date, numberOfLikes: Int) {
        self.user = user
        self.mediaType = .photo
        self.timestamp = timestamp
        self.numberOfLikes = numberOfLikes
    }
}

class Video {
    let user: User
    let mediaType: MediaType
    let timestamp: Date
    let numberOfLikes: Int
    
    init(user: User, timestamp: Date, numberOfLikes: Int) {
        self.user = user
        self.mediaType = .video
        self.timestamp = timestamp
        self.numberOfLikes = numberOfLikes
    }
}

func formatLikesCount(_ count: Int) -> String {
    if count >= 1000 {
        return "\(count / 1000)k"
    } else {
        return "\(count)"
    }
}

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    return formatter.string(from: date)
}

let user1 = User(username: "Adam")
let user2 = User(username: "Artur")

let photo1 = Photo(user: user1, timestamp: Date(), numberOfLikes: 413000)
let photo2 = Photo(user: user2, timestamp: Date(), numberOfLikes: 12000)
let photo3 = Photo(user: user1, timestamp: Date(), numberOfLikes: 3400)

let video1 = Video(user: user2, timestamp: Date(), numberOfLikes: 7500)
let video2 = Video(user: user1, timestamp: Date(), numberOfLikes: 21000)

let posts: [Any] = [photo1, photo2, photo3, video1, video2]

for item in posts {
    if let item = item as? Photo {
        print("Profile name: \(item.user.username) | Media type: Photo | Date: \(formatDate(item.timestamp)) | Likes: \(formatLikesCount(item.numberOfLikes))")
    } else if let item = item as? Video {
        print("Profile name: \(item.user.username) | Media type: Video | Date: \(formatDate(item.timestamp)) | Likes: \(formatLikesCount(item.numberOfLikes))")
    }
}
