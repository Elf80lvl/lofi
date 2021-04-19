class SongData {
  int songNumber;
  String songName;
  bool isPlaying = false;

  SongData({this.songNumber, this.songName, this.isPlaying});
}

List<SongData> songData = [
  SongData(
    songNumber: 1,
    songName: 'Rebel Heart',
    isPlaying: true,
  ),
  SongData(
    songNumber: 2,
    songName: 'It\'s a Shame',
  ),
  SongData(
    songNumber: 3,
    songName: 'Fireworks',
  ),
  SongData(
    songNumber: 4,
    songName: 'Postcard',
  ),
  SongData(
    songNumber: 5,
    songName: 'To Live a Life',
  ),
  SongData(
    songNumber: 6,
    songName: 'My Wild Sweet Love',
  ),
  SongData(
    songNumber: 7,
    songName: 'Distant Star',
  ),
  SongData(
    songNumber: 8,
    songName: 'Ruin',
  ),
  SongData(
    songNumber: 9,
    songName: 'Hem of Her Dress',
  ),
  SongData(
    songNumber: 10,
    songName: 'Nothing Has to Be True',
  ),
  SongData(
    songNumber: 11,
    songName: 'Sample Long Name to Test the text overflow',
  ),
  SongData(
    songNumber: 12,
    songName: 'Sample Long Name to Test the text overflow',
  ),
  SongData(
    songNumber: 14,
    songName: 'Sample Long Name to Test the text overflow',
  ),
];
