import 'package:flutter/material.dart';
import 'package:opencontrol/themes.dart';
import 'package:videosdk/videosdk.dart';

class ParticipantView extends StatelessWidget {
  final Stream? stream;
  final bool isMicOn;
  final Color? avatarBackground;
  final Participant participant;
  final bool isLocalScreenShare;
  final bool isScreenShare;
  final double avatarTextSize;
  final Function() onStopScreeenSharePressed;
  const ParticipantView(
      {Key? key,
      required this.stream,
      required this.isMicOn,
      required this.avatarBackground,
      required this.participant,
      this.isLocalScreenShare = false,
      this.avatarTextSize = 50,
      required this.isScreenShare,
      required this.onStopScreeenSharePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        stream != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: RTCVideoView(
                  stream?.renderer as RTCVideoRenderer,
                  objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                ),
              )
            : Center(
                child: !isLocalScreenShare
                    ? Container(
                        padding: EdgeInsets.all(avatarTextSize / 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: avatarBackground,
                        ),
                        child: Text(
                          participant.displayName.characters.first
                              .toUpperCase(),
                          style: TextStyle(fontSize: avatarTextSize),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 30),
                                color: Colors.amber,
                                child: const Text("Stop Presenting",
                                    style: TextStyle(fontSize: 16)),
                                onPressed: onStopScreeenSharePressed)
                          ])),
        if (!isMicOn)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.mic_off,
                  size: avatarTextSize / 2,
                )),
          ),
        if (isScreenShare)
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: Text(isScreenShare
                  ? "${isLocalScreenShare ? "You" : participant.displayName} is presenting"
                  : participant.displayName),
            ),
          ),
      ],
    );
  }
}

class OneToOneMeetingContainer extends StatefulWidget {
  final Room meeting;
  const OneToOneMeetingContainer({Key? key, required this.meeting})
      : super(key: key);

  @override
  State<OneToOneMeetingContainer> createState() =>
      _OneToOneMeetingContainerState();
}

class _OneToOneMeetingContainerState extends State<OneToOneMeetingContainer> {
  Stream? localVideoStream;
  Stream? localShareStream;
  Stream? localAudioStream;
  Stream? remoteAudioStream;
  Stream? remoteVideoStream;
  Stream? remoteShareStream;

  Stream? largeViewStream;
  Stream? smallViewStream;
  Participant? largeParticipant, smallParticipant;
  Participant? localParticipant, remoteParticipant;
  String? activeSpeakerId, presenterId;

  bool isSmallViewLeftAligned = false;

  @override
  void initState() {
    localParticipant = widget.meeting.localParticipant;
    // Setting meeting event listeners
    setMeetingListeners(widget.meeting);

    try {
      remoteParticipant = widget.meeting.participants.isNotEmpty
          ? widget.meeting.participants.entries.first.value
          : null;
      if (remoteParticipant != null) {
        addParticipantListener(remoteParticipant!, true);
      }
    } catch (error) {}
    addParticipantListener(localParticipant!, false);
    super.initState();
    updateView();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: IntrinsicHeight(
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: ParticipantView(
                avatarBackground: Colors.black,
                stream: largeViewStream,
                isMicOn: remoteParticipant != null
                    ? remoteAudioStream != null
                    : localAudioStream != null,
                onStopScreeenSharePressed: () =>
                    widget.meeting.disableScreenShare(),
                participant: remoteParticipant != null
                    ? remoteParticipant!
                    : localParticipant!,
                isLocalScreenShare: localShareStream != null,
                isScreenShare:
                    remoteShareStream != null || localShareStream != null,
                avatarTextSize: 40,
              )),
          if (remoteParticipant != null || localShareStream != null)
            Positioned(
                right: isSmallViewLeftAligned ? null : 8,
                left: isSmallViewLeftAligned ? 8 : null,
                bottom: 8,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                    int sensitivity = 8;
                    if (details.delta.dx > sensitivity) {
                      // Right Swipe
                      setState(() {
                        isSmallViewLeftAligned = false;
                      });
                    } else if (details.delta.dx < -sensitivity) {
                      //Left Swipe
                      setState(() {
                        isSmallViewLeftAligned = true;
                      });
                    }
                  },
                  child: Container(
                      height: 160,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      child: ParticipantView(
                        avatarTextSize: 30,
                        avatarBackground: Colors.black,
                        stream: smallViewStream,
                        isMicOn: (localAudioStream != null &&
                                remoteShareStream == null) ||
                            (remoteAudioStream != null &&
                                remoteShareStream != null),
                        onStopScreeenSharePressed: () =>
                            widget.meeting.disableScreenShare(),
                        participant: remoteShareStream != null
                            ? remoteParticipant!
                            : localParticipant!,
                        isLocalScreenShare: false,
                        isScreenShare: false,
                      )),
                )),
        ]),
      ),
    );
  }

  void setMeetingListeners(Room _meeting) {
    // Called when participant joined meeting
    _meeting.on(
      Events.participantJoined,
      (Participant participant) {
        setState(() {
          remoteParticipant = widget.meeting.participants.isNotEmpty
              ? widget.meeting.participants.entries.first.value
              : null;
          updateView();

          if (remoteParticipant != null) {
            addParticipantListener(remoteParticipant!, true);
          }
        });
      },
    );

    // Called when participant left meeting
    _meeting.on(
      Events.participantLeft,
      (participantId) {
        if (remoteParticipant?.id == participantId) {
          setState(() {
            remoteParticipant = null;
            remoteShareStream = null;
            remoteVideoStream = null;
            updateView();
          });
        }
        setState(() {
          remoteParticipant = widget.meeting.participants.isNotEmpty
              ? widget.meeting.participants.entries.first.value
              : null;
          if (remoteParticipant != null) {
            addParticipantListener(remoteParticipant!, true);
            updateView();
          }
        });
      },
    );

    _meeting.on(Events.presenterChanged, (_presenterId) {
      setState(() {
        presenterId = _presenterId;
      });
    });

    // Called when speaker is changed
    _meeting.on(Events.speakerChanged, (_activeSpeakerId) {
      setState(() {
        activeSpeakerId = _activeSpeakerId;
      });
    });
  }

  void updateView() {
    Stream? _largeViewStream, _smallViewStream;
    if (remoteParticipant != null) {
      if (remoteShareStream != null) {
        _largeViewStream = remoteShareStream;
      } else if (localShareStream != null) {
        _largeViewStream = null;
      } else {
        _largeViewStream = remoteVideoStream;
      }
      if (remoteShareStream != null || localShareStream != null) {
        if (remoteVideoStream != null) {
          _smallViewStream = remoteVideoStream;
        }
      } else {
        _smallViewStream = localVideoStream;
      }
    } else {
      if (localShareStream != null) {
        _smallViewStream = localVideoStream;
      } else {
        _largeViewStream = localVideoStream;
      }
    }
    setState(() {
      largeViewStream = _largeViewStream;
      smallViewStream = _smallViewStream;
    });
  }

  void addParticipantListener(Participant participant, bool isRemote) {
    participant.streams.forEach((key, Stream stream) {
      setState(() {
        if (stream.kind == 'video') {
          if (isRemote) {
            remoteVideoStream = stream;
          } else {
            localVideoStream = stream;
          }
        } else if (stream.kind == 'share') {
          if (isRemote) {
            remoteShareStream = stream;
          } else {
            localShareStream = stream;
          }
        } else if (stream.kind == 'audio') {
          if (isRemote) {
            remoteAudioStream = stream;
          } else {
            localAudioStream = stream;
          }
        }
        updateView();
      });
    });
    participant.on(Events.streamEnabled, (Stream _stream) {
      setState(() {
        if (_stream.kind == "video") {
          if (isRemote) {
            remoteVideoStream = _stream;
          } else {
            localVideoStream = _stream;
          }
        } else if (_stream.kind == "share") {
          if (isRemote) {
            remoteShareStream = _stream;
          } else {
            localShareStream = _stream;
          }
        } else if (_stream.kind == 'audio') {
          if (isRemote) {
            remoteAudioStream = _stream;
          } else {
            localAudioStream = _stream;
          }
        }
        updateView();
      });
    });

    participant.on(Events.streamDisabled, (Stream _stream) {
      setState(() {
        if (_stream.kind == "video") {
          if (isRemote) {
            remoteVideoStream = null;
          } else {
            localVideoStream = null;
          }
        } else if (_stream.kind == "share") {
          if (isRemote) {
            remoteShareStream = null;
          } else {
            localShareStream = null;
          }
        } else if (_stream.kind == 'audio') {
          if (isRemote) {
            remoteAudioStream = null;
          } else {
            localAudioStream = null;
          }
        }
        updateView();
      });
    });
  }
}

class ParticipantLimitReached extends StatelessWidget {
  final Room meeting;
  const ParticipantLimitReached({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "OOPS!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "Maximun 2 participants can join this meeting",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "Please try again later",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            MaterialButton(
              onPressed: () {
                meeting.leave();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: primaryColor,
              child: const Text("Ok", style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}