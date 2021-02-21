import 'package:twilio_programmable_video/twilio_programmable_video.dart';
import 'dart:async';

Room _room;
final Completer<Room> _completer = Completer<Room>();

void _onConnected(Room room) {
  print('Connected to ${room.name}');
  _completer.complete(_room);
}

void _onConnectFailure(RoomConnectFailureEvent event) {
  print(
      'Failed to connect to room ${event.room.name} with exception: ${event.exception}');
  _completer.completeError(event.exception);
}

Future<Room> connectToRoom(String room) async {
  var connectOptions = ConnectOptions(
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzIwNTgyYWIwNTJjYmYyZWM2ZTA5MGY4Y2EzN2UxMTE4LTE2MTM5MTY0NzEiLCJpc3MiOiJTSzIwNTgyYWIwNTJjYmYyZWM2ZTA5MGY4Y2EzN2UxMTE4Iiwic3ViIjoiQUNlNDhlZGRkN2MxZGVkYzdlOGY1OTFkMTY5NTA3NWVhOCIsImV4cCI6MTYxMzkyMDA3MSwiZ3JhbnRzIjp7ImlkZW50aXR5IjoiamtsIiwidmlkZW8iOnt9fX0.muswpblJnTi4DzT3DREPADCRyWPbsFFxVmwCjOQD28I',
    roomName: room, // Optional name for the room
    preferredAudioCodecs: [
      OpusCodec()
    ], // Optional list of preferred AudioCodecs
    preferredVideoCodecs: [
      H264Codec()
    ], // Optional list of preferred VideoCodecs.
    audioTracks: [LocalAudioTrack(true)], // Optional list of audio tracks.
    dataTracks: [
      LocalDataTrack(DataTrackOptions())
    ], // Optional list of data tracks
    videoTracks: ([
      LocalVideoTrack(true, CameraCapturer(CameraSource.FRONT_CAMERA))
    ]), // Optional list of video tracks.
  );
  _room = await TwilioProgrammableVideo.connect(connectOptions);
  _room.onConnected.listen(_onConnected);
  _room.onConnectFailure.listen(_onConnectFailure);
  return _completer.future;
}
