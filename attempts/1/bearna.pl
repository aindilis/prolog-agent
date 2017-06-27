steps('disconnect storage',[]).
steps('reconnect storage',[]).
steps('connect to the internet',['disconnect storage']).
steps('disconnect from the internet',['reconnect storage']).
steps('connect to ann',[]).
steps('disconnect from ann',[]).
steps('move files from ann to game',['connect to ann','disconnect from ann']).
steps('clean-ann-of-files',['move files from ann to game']).
steps('play roms',[]).
steps('play 3d movies',[]).
steps('play 2d movies',[]).
steps('browse tor online',[]).
steps('browse i2p online',[]).
