#### some infos about X protocol

https://www.reddit.com/r/linux/comments/4bq9kl/eli5_wayland_vs_mir_vs_x11/?st=it4369v9&sh=df252944

> Xorg is the current de facto standard display server on Linux, basically what pushes and blends pixels from the different desktop applications onto your screen. The clients use the X11 protocol to speak with Xorg.
>
Despite still being perfectly usable, it was designed several decades ago when most of the stuff was being rendered on the server side. So basically all window elements, buttons, fonts, etc. were being allocated and rendered by the Xorg server, while clients were just sending "commands" to tell Xorg what to draw and where.
>
Today this model has almost completely disappeared. Almost everything is done client-side and clients just push pixmaps (so pictures of their window) to the display server and a window manager will blend them and send the final image to the server. So most of what the Xorg server was made for is not being used anymore, and the X server is noadays just a pointless middleman that slows down operations for nothing. Xorg is also inherently insecure with all applications being able to listen to all the input and snoop on other client windows.
>
So since the best solution would certainly involve breaking the core X11 protocol, it was better to make something from scratch that wouldn't have to carry the old Xorg and X11 cruft, and thus Wayland was born.
>
Wayland basically makes the display server and window manager into one single entity called a compositor. What the compositor does is take pixmaps from windows, blend them together and display the final image and that's it. No more useless entity in the middle which means way less IPC and copies which leads to much better performance and less overhead. The compositor also takes care of redirecting input to the correct clients which makes it vastly more secure than in the X11 world. A Wayland compositor also doesn't need a "2D driver" like Xorg does (DDX) at the moment since everything is done client-side and it only reuses the DRM/KMS drivers for displaying the result image.
>
(Mir is more or less the same than Wayland, except with some internal differences (API vs protocol) and for now Ubuntu/Unity 8 specific.)
