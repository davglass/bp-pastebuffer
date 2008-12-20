try
   set png_image to «class PNGf» of (the clipboard as record)
   set file_name to ((path to temporary items from user domain as string) & (time of (current date) as string) & ".png")
   set the_file to open for access file file_name with write permission
   write png_image to the_file
   close access the_file
   return POSIX path of file_name
end try

