# vladsLab

What is this?
-------------

This is a short demo by Jack Welch. It gets around the issue of not 
being able to directly type non-Latin unicode (for this test case, 
Cyrillic) into the I7 parser. It does this by transliterating the 
input on the fly, before the parser ever see it.

Give it a try online: 
https://templaro.com/games/vladsLab/Release1/play.html

This trick relies on Vorple, a javascript framework that extends I7.
I took a bludgeon to the core file of Vorple to intercept the text
submitted on the input line, an HTML text input field on a form, and
transliterate to ascii characters. All my edits are in one pretty
obvious area in that file.

The transliteration scheme is pretty standard, although I used
"&" and "#" for the soft sign and hard sign, respectively. There
is some degeneracy in this transliteration, i.e., it works
deterministically in one direction, from Cyrillic to Latin, but not
the reverse, since some cyrillic letters map to a single latin letter,
e.g., "е", "ё", and "э" all map to "e".

FWIW, the code is released under the MIT license, which you can find in 
the LICENSE file. My purpose in putting it on the repo is so others can 
use it for their own projects, so please do.

The game is written in the Inform 7 programming language, using
version 6M62, the most recent version available at the time of
writing. You can download the compiler and IDE as a single
package from http://www.inform7.com

The project includes Vorple version 3.1 as an extension.
Vorple lives at https://vorple-if.com/.

The game's source code lives in a single file called 'story.ni'.
The other important file that I have modified is 'vorple.min.js',
which is part of the Vorple distribution.


To build the game:
------------------

	1. Create a working Inform project from your source tree:

		$ git clone URL vladsLab
  
		$ cd vladsLab
  
		$ mv vladsLab.inform/ temp.inform/
		
		$ cp vladsLab.materials/Templates/Vorple/vorple.min.js .

	[...launch Inform, create new project in this dir called 'trfv'…]

		$ cp temp.inform/Source/story.ni vladsLab.inform/Source/
  
		$ cp temp.inform/uuid.txt vladsLab.inform/
  
		$ rm -rf temp.inform/

	2. Install Vorple per instructions on the vorple website (above). Don't install
	it system-wide. Put the Extensions and Templates under vladsLabs.materials. Move
	the modified javascript file to overright the one that comes with Vorple:
	
		$ mv vorple.min.js vladsLab.materials/Templates/Vorple/vorple.min.js

	3. Launch the Inform IDE and load the vladsLab.inform project.  The source code 
	should be visible, and it should compile fine. Make sure that Inform's 
	settings are are set to "Glulx" as the target VM. 

WARNING!!

	DO NOT do any version control operations (commit, push, and particularly, 
	pull, update, and merge) while the Inform IDE  is still open.  When the IDE 
	'saves', it destroys and recreates  the whole trfv.inform/ directory, thus
	possibly eradicating and changes you may have downloaded.  

