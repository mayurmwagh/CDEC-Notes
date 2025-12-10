1. Overview of Vim and Its History

Vim stands for Vi IMproved.

Created by Bram Moolenaar in 1991 as an extended version of the original vi editor from Unix.

Known for:

Efficiency (keyboard-based editing, no mouse required)

Modal editing

Extensibility via plugins

Default editor on many Linux systems.

Ideal for developers, system administrators, and power users.

2. Basic Concepts: Modes in Vim

Vim is a modal editor, meaning the keyboard behaves differently depending on the mode.

a) Command Mode (Normal Mode)

Default mode when you open Vim.

Used for navigation, copy/paste, deleting text, etc.

Press Esc anytime to return to this mode.

b) Insert Mode

Used for typing and editing text normally.

Enter using:

i → insert before cursor

a → append after cursor



c) Visual Mode

Used for selecting text.

Enter using:

v → visual (character-wise)

V → visual line

Ctrl + v → block selection

d) Execute Mode (Command-Line Mode / Ex Mode)

Used for executing colon commands such as save, quit, search, etc.

Enter using: :
Example commands:

:w → save

:q → quit

:wq → save & quit



1.command line mode:-default mode
   > G------------end of the file/line.
   > gg-----------top of file/line.
   > yy-----------copy line
   > p--(small)---pest copy 
   > P--(capital)-pest copy line 
   > nyy----------copy  no.of lines
   > dd-----------delete a particular line 
   > u------------undo
   > Ctrl+r-------Redo
   > cc--cut the line
   > ncc--cut n no of line
   > dw---delete current word
   > /"<word>"----serch particular word
   > e-----------go end of word
   > b ----------go beagining of word
   > <line no>gg---move cursor at 10th line.in /etc/passwd file
   
   2. insert mode
   
   > I------Beagining of line
   > i------insert at current cursor position.
   > O-----create line above the present cursor.
   > o------create line below the present cursor.
   > A------insert at the end of current line.
  
  3. Exicution 
 
  > :wq!--Or--:x--save and quit forcfully
  > :set nu---set line no.
  > :<no.>---jump to particular line no.
  > :/<word>---highlight the word
  > :nohl-----remove highlight
  > :%s/old/new/g
  > !-------exicute any command on terminal without leaving editor.
  > !q  --- quit without saving 


  4. Visual mode
  > v-------select charector by charector
  > V-------select line by line
  > Ctrl+v---select block
  > y,d,c----for copy.delete,cut selected area.