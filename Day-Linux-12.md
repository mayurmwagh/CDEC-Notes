Link count 

types of link 

1. hard link
2. soft link

1. hardlink
    this link have actual contents
    syntax:
        ln originalfilename link_name

    removing link just reduce the link count, but dosen't affect other links
    deleting or renaming the original file will not affect the link
    hardlink file is assigned the same inode value as the orginal so they refer the same physical location
        inode no: 
            An inode no is uniquely exsting number for all the files in linux 
                when the file is created on the system a file name and inode no get assigned to it

            to check inode no cmd is 
                syntax: ls -li filename


2. soft link 
    1. soft link contents the path for origional file and not the content 

    syntax:
        ln -s original_filename link_name

    2. removing softlink dosn't affect anything but removing original file the link becomes dangling link which points to non existing file

    3. inode no is differnt than origional file 
    4. if we change the name of original file then all soft links for that file become dangling i.e they are worthless

