# Welcome to the Ruby Entity-Component Framework
This framework (RECF for short) is designed to help game authors construct 
modern, high-performance games using the elegant Ruby language and a fairly
new alternative to OOP called "entity-component systems". An Entity-
Component System is a programming methodology that successfully addresses many
shortcomings of OOP and streamlines game creation and maintenance.

The RECF has been documented in a series of blog posts by the author:
[Entity-Component game programming using JRuby and libGDX](http://cbpowell.wordpress.com/2012/10/30/entity-component-game-programming-using-jruby-and-libgdx-part-1/)

# Dependencies
The RECF utilizes libGDX (and LWJGL) to operate, although it has also been
adapted to Slick2D. These are bundled with the RECF source and don't need to
be separately downloaded.

The RECF uses JRuby and has been tested with version 1.7. You'll need to 
install your own JRuby interpreter (with, say, RVM).

# Further reading about Entity-Component Frameworks

E-C systems are quite different from Object Oriented Programming, especially
if you are already a seasoned OO programmer. These resources will help you
learn the justifications and benefits of E-C over OO:

* In [this article](http://humespeaks.tumblr.com/post/21273251357/ludum-dare-dry-run-lessons-learned), read the comment that begins with "*Oh man, the Entity Systems question.*" Hume tidily articulates the typical problem that OO creates but EC fixes.
* [This T=Machine blog series](http://t-machine.org/index.php/2007/09/03/entity-systems-are-the-future-of-mmog-development-part-1/) offers a highly detailed and experienced look at the advantages to EC in MMO development.
* [This article](http://cowboyprogramming.com/2007/01/05/evolve-your-heirachy/) is a commonly referenced piece on OO vs. EC.
* [This wiki](http://entity-systems.wikidot.com/) is one of the canonical EC references; you’ll return there often for advice.
