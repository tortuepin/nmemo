
'''
getUserData
arg
    filename : filename of userdata
ret
    dictonary: {"email":'', "password":''}

datafile should be this structure : 
1. email
2. password
number and '.' which is in head represent linenumber.
so you don't need write it in datafile.
'''
def getUserData(filename):
    data = {"email":'', "username":''}
    f = open(filename, 'r')
    data["email"] = f.readline().strip()
    data["password"] = f.readline().strip()
    
    return data

'''
fetch AuthData
arg
    email
    password
ret
    authData : simplenote object
'''
def fetchAuthData(email, password):
    authData = simplenote.Simplenote(email, password)
    return authData
