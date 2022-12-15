# Prolog-IDE: A browser-based IDE for programming in Prolog.

I'm trying to study Prolog, in particular [Constraint Logic Programming](https://github.com/tbensky/Prolog-CLP). I found myself making progress, until it
suddenly dawned on me that I working on Prolog using the macOS CLI. I was literally editing in VSCodium and then manually running SWI Prolog from an XTerm. This cycle got kind of irritating, so I went looking for a Prolog IDE. 

[SWISH](https://swish.swi-prolog.org) seems very polished, but I wanted something that ran locally, and I don't want to use [EMACS](https://www.metalevel.at/ediprolog/). I looked at trying to morph Eclipse or Jetbeans, but didn't even know where to start.  [BBEdit](https://barebones.com) and [TextWrangler](https://barebones.com) will execute Applescript from within the editor, so conceivably SWI Prolog could be run that way, but I never understood Applescript. Next I looked at Python's [tkinter](https://docs.python.org/3/library/tkinter.html) and [wxPython](https://wxpython.org), thinking maybe I'd write some OS-level text editorr and shell out to SWI Prolog from there.  I made a simple editor, but it was ugly.

I had done some [other work](https://physgl.csm.calpoly.edu) with [Codemirror](https://codemirror.net), so I decided to code up a browser-based IDE.  I found
[WinBox.js](https://nextapps-de.github.io/winbox/), and put it all together into what you see here:

![Sample of Prolog, showing editor, output, and error windows](https://github.com/tbensky/Prolog-IDE/blob/main/sample.png)

To get the browser to be able to access SWI Prolog installed locally, I'd need a http-shim to sit between the browser and SWI Prolog, which I wrote in Python.


At the moment, I can edit, and hit run. STDOUT from SWI Prolog is routed to the output window, and STDErr is routed to the error window. SWI Prolog seems to know when it's not connected to a terminal, so it is rather well-behaved when shelled out to using Python's `subprocess.run` function.  

Pretty simple, but it works Ok and has taken me away from the low-level edit-terminal-edit cycle.