pragma solidity ^0.8.0;

contract MusicSharing {
    struct Song {
        uint id;
        string title;
        string artist;
        string url;
        address uploader;
    }

    Song[] public songs;
    uint public nextId;

    event SongUploaded(uint id, string title, string artist, string url, address uploader);

    function uploadSong(string memory _title, string memory _artist, string memory _url) public {
        songs.push(Song(nextId, _title, _artist, _url, msg.sender));
        emit SongUploaded(nextId, _title, _artist, _url, msg.sender);
        nextId++;
    }

    function getSong(uint _id) public view returns (uint, string memory, string memory, string memory, address) {
        require(_id < nextId, "Song does not exist");
        Song memory song = songs[_id];
        return (song.id, song.title, song.artist, song.url, song.uploader);
    }

    function getAllSongs() public view returns (Song[] memory) {
        return songs;
    }
}
