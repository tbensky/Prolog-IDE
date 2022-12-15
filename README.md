# Prolog-IDE: A browser-based IDE for programming in Prolog.

I'm trying to study Prolog, in particular [Constraint Logic Programming](https://github.com/tbensky/Prolog-CLP). I found myself making progress, until it
suddenly dawned on me that I working on Prolog using the macOS CLI. I was literally editing in VSCodium and then manually running SWI Prolog from an XTerm. All of the fighting with the SWI top-level (Control-Cs, -Ds, and up/down arrows in the CLI) started to get very irritating, so I went looking for a Prolog IDE. 

[SWISH](https://swish.swi-prolog.org) seems very polished, but I wanted something that ran locally, and I don't want to use [EMACS](https://www.metalevel.at/ediprolog/). I looked at trying to morph Eclipse or Jetbeans into a Prolog IDE, but didn't even know where to start.  [BBEdit](https://barebones.com) and [TextWrangler](https://barebones.com) will execute Applescript from within the editor, so conceivably SWI Prolog could be run that way, but I never understood Applescript. Next I looked at Python's [tkinter](https://docs.python.org/3/library/tkinter.html) and [wxPython](https://wxpython.org), thinking maybe I'd write some OS-level text editor and shell out to SWI Prolog from there.  I made a simple editor, but it was ugly and expanding it with features would be tough.

I had done some [other work](https://physgl.csm.calpoly.edu) with [Codemirror](https://codemirror.net), so I decided to code up a browser-based IDE.  I found
[WinBox.js](https://nextapps-de.github.io/winbox/), and put it all together into what you see here:

![Sample of Prolog, showing editor, output, and error windows](https://github.com/tbensky/Prolog-IDE/blob/main/sample.png)

To get the browser to be able to access SWI Prolog installed locally, I'd need a http-shim to sit between the browser and SWI Prolog, which I wrote in Python from the standard "Python Webserver" examples.


At the moment, the IDE allows for editing a source file, and hitting run. Python's `subproceess.run` executing SWI Prolog nicely captures `stdout` and `stderr` from SWI Prolog, which are routed to the appropriate window. SWI Prolog seems to know when it's not connected to a terminal, so it  behaves rather well as a shell command.  It always halts itself and never gets bound up in a `?-` prompt.

Pretty simple, but it works Ok and has taken me away from the low-level edit-terminal-edit cycle.

# Files

* `http_shim.py` is the http shim that allows the browser to interface to SWI Prolog.  When running, you can start up the IDE by typing `http://localhost:8080` in your web-browsers. Apache is not needed.

* `prolog_ide.html` is the html file for the IDE. Do not load this using File->Open on your browser as it will not work. `http_shim.py` will read this and send it to your browser via the http request.

# To do

* Work on syntax highlighting in codemirror.