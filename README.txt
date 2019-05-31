INTRO
======================================================================

Example code for fast population coding with sparse spike trains. 
This code is released in conjunction with the paper 

	Huys QJM, Zemel RS, Natarajan R and Dayan P (2006): Fast population
	coding. Neural Computation
	
and can be downloaded from 

	http://www.gatsby.ucl.ac.uk/~qhuys/code.html

The paper can be downloaded from

      http://www.gatsby.ucl.ac.uk/~qhuys/pub/hznd06.pdf

Copyright Quentin Huys 2006
qhuys@gatsby.ucl.ac.uk


HOW TO
======================================================================

To use the code, unzip it, eg on a linux machine type
	
	gunzip hznd06_code.gz

Which will create a directory with all the files. 

From within Matlab, change to that directory by typing eg
	
	cd hznd06_code

Edit the file PARAM.M to change any parameters you want, like whether to use a
smooth or a OU prior and what firing rate and tuning widths to use. You
should not have to edit any of the other files. 

To run the inference, simply type
	
	main

and hit ENTER. Enjoy. 


BUGS
======================================================================

I don't know of any bugs at the moment, but please do let me know if you find
any (qhuys@gatsby.ucl.ac.uk)
