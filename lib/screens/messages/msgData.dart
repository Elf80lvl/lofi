class MsgData {
  String imgURL, name, msgPreview, time;
  int msgCount;
  bool isOnline;

  MsgData(
      {this.imgURL,
      this.name,
      this.msgPreview,
      this.time,
      this.msgCount,
      this.isOnline});
}

List<MsgData> data = [
  MsgData(
    imgURL: 'assets/image/chatAvatars/till.jpg',
    name: 'Till',
    msgPreview: 'Did you like the latest album?mmmmmmmm',
    msgCount: 4,
    time: '12:02',
    isOnline: false,
  ),
  MsgData(
    imgURL: 'assets/image/chatAvatars/matt.jpg',
    name: 'Matt Wellamy',
    msgPreview: 'I like the vibes!',
    msgCount: 11,
    time: '10:11',
    isOnline: false,
  ),
  MsgData(
    imgURL: 'assets/image/chatAvatars/lana.jpg',
    name: 'Lana Del Ring',
    msgPreview: 'Summertime finally!',
    msgCount: 9,
    time: '9:23',
    isOnline: true,
  ),
  MsgData(
    imgURL: 'assets/image/chatAvatars/tom.jpg',
    name: 'Tom Angeles',
    msgPreview: 'This gonna be a hit',
    time: '7:00',
    isOnline: true,
  ),
  MsgData(
    imgURL: 'assets/image/chatAvatars/tobias.jpg',
    name: 'Tobias Mold',
    msgPreview: 'Trying my best!',
    time: '6:55',
    isOnline: true,
  ),
  MsgData(
    name: 'Tilo Fox',
    imgURL: 'assets/image/chatAvatars/tilo.jpg',
    msgPreview: 'In the dark',
    time: '6:54',
    isOnline: false,
  ),
  MsgData(
    name: 'Elena Tonro',
    imgURL: 'assets/image/chatAvatars/elena.jpg',
    msgPreview: 'Doing the right thing',
    time: '12 Jun',
    isOnline: false,
  ),
  MsgData(
    name: 'Julia Rock',
    imgURL: 'assets/image/chatAvatars/julia.jpg',
    msgPreview: 'Rainbows and butterflies!',
    time: '11 Jun',
    isOnline: false,
  ),
  MsgData(
    name: 'Chelsea Foxy',
    imgURL: 'assets/image/chatAvatars/chelsea.jpg',
    msgPreview: 'acoustic',
    time: '10 Jun',
    isOnline: false,
  ),
];
