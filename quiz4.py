#William Martin
#Quiz fwor

fo = open("new_song.txt", "r")
file_string = fo.read()
fo.close()

file_string = file_string.replace("espresso", "Domingo")
file_string = file_string.replace("Nintendo" , "non copywrite game company")

fb = open("foo.txt", "w+")
fb.write(file_string)
fb.seek(0)
new_string = fb.read()
print(new_string)
fb.close()

#special function that saves headache
#new_string = file_string.replace("text to replace", "new words")
