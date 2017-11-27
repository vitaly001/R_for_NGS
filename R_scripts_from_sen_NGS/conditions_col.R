#remove all characters from name of libraries before _ and save the rest in column conditions

dat$conditions=gsub('.*_', '', dat$LibraryName)

#create time column for each conditions, install stringr package and use extract command with pattern defined by regular expressions

dat$time=str_extract(dat$LibraryName, '^*\\d\\d[D, H]')

# in UNIX terminal type next command to unzip all gz file in all subdirectories. gunzip has -r option --recursive
#Travel the directory structure recursively. If any of the file names specified on the command line are directories, gzip will descend into the directory and compress all the files it findsthere (or decompress them in  the  case  of gunzip ).
gunzip -r /Volumes/HD2/GudkovRS

#rename folders using workflow in macos
