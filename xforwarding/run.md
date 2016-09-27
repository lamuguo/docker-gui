from http://stackoverflow.com/questions/24095968/docker-for-gui-based-environments:

add
```
-e QT_X11_NO_MITSHM=1
```

explanations:

 - `QT_NO_GLIB` – prevents Qt from using GLib’s event loop.
 - `QT_SLOW_TOPLEVEL_RESIZE` – used to solve KDE bug #157659.
 - `QT_USE_NATIVE_WINDOWS` – makes Qt flicker :-)
 - `QT_X11_NO_FONTCONFIG` – makes Qt not to use X11’s FontConfig.
 - `QT_X11_NO_MITSHM` – stops Qt form using the MIT-SHM X11 extension.
 - `QT_X11_NO_XRENDER` – prevents Qt from using the Xrender extension.

[(source)](http://www.thelins.se/johan/blog/2008/12/it-is-all-about-the-environment/)
