# Mabool for VG5000µ

The source code of Mabool is written in Basic language, included in the original ROM of computers of the time. In order to save time and comfort, the code has been written in RSCRIPT. RSCRIPT is a transpiler coded in NODEJS, which transforms .rscript scripts into final BASIC code, readable by older machines. 

Purists will probably be suspicious of this programming approach, or even disappointed, but if you look at the .rscript files, you will see that it is indeed BASIC of the time, and not a specific language for RSCRIPT.

<b>Build the BASIC code from sources</b><br>
To build the final BASIC code from the .rscript source files, execute the batch script "<b>mabool.bat</b>". The <b>code.bas</b> file must be created in this folder.

<b>Launch the program</b><br>
To run the program you must use a VG5000 machine emulator. The most successful emulator is DGVG5K which you can find here :http://dcvg5k.free.fr/ 
Execute the emulator program. You should see a cyan screen and "OK". From the file menu ("fichier"), click on "Simuler le clavier...".

Select the mabool.bas file generated from the build and click on the button named "Simuler avec le fichier texte". You will see the listing of your program appear on the screen. Wait for the end (a few seconds). 

Now, type RUN + Enter. Et voilà!
