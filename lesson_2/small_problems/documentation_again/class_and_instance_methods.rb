# Locate the ruby documentation for methods File::path and File#path. 
# How are they different?

# They are differet in how they are called and what they return.
# File::Path is a class method and is returned by calling .path on the 
# File class. 
# File#path is an instance method and is called invoking .path on a created File
# object.