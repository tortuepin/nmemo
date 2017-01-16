# vim:set foldmethod=marker:

import simplenote
import os.path
def get_User_Data(filename): #{{{
    '''
    get user data from file

    ret
        dictonary: {"email":'', "password":''}

    datafile should be this structure : 
    1. email
    2. password
    number and '.' which is in head represent linenumber.
    so you don't need write it in datafile.
    '''

    data = {"email":'', "username":''}
    f = open(filename, 'r')
    data["email"] = f.readline().strip()
    data["password"] = f.readline().strip()
    
    return data
    #}}}

def fetch_Auth_Data(email, password):#{{{
    '''
    fetch authdata from the internet.
    '''
    authData = simplenote.Simplenote(email, password)
    return authData
#}}}

def fetch_tomemo_index(authData):#{{{
    '''
    fetch note about tomemo from the internet.
    '''
    return authData.get_note_list(tags=["tomemo"])
#}}}

def make_note_list(authData):#{{{
    '''
    make tomemo note list.
    {"title":"noteData"}
    '''
    index = fetch_tomemo_index(authData)
    noteList = {}

    for noteIndex in index[0]:
        noteData = authData.get_note(noteIndex['key'])[0]
        title = noteData['content'].split("\n")[0]
        noteList[title] = noteData

    return noteList
#}}}

def update_note(noteData, authData):#{{{
    '''
    update note.
    noteData is fetched by get_note method
    '''
    if authData.update_note(noteData)[1] == -1:
        return -1
    return -1
#}}}

def save_note_on_file(filename, noteData):#{{{
    '''
    save note on 'filename'.
    '''
    f = open(filename, 'w')
    f.write(modify_content_to_file(noteData['content'])) 
    f.close()
#}}}

def modify_content_to_file(content):#{{{
    '''
    cut down the title and return only content.
    '''
    lines = content.split("\n")
    del lines[0]
    ret = "\n".join(lines)

    return ret
#}}}

def modify_file_to_content(filename):#{{{
    '''
    modifiy file to fit simplenote content.
    '''

    f = open(filename, 'r')
    ret = f.read()
    ret = os.path.basename(filename) + "\n" + ret
    f.close()

    return ret
#}}}

def sync_file(authData, filepath, notelist):#{{{
    '''
    sync file on filepath of arg.
    this method overwrite notedata on simplenote.

    arg
        notelist : notelist on simplenote
    '''

    note = notelist[os.path.basename(filepath)]
    note["content"] = modify_file_to_content(os.path.basename(filepath))
    update_note(note, authData)
#}}}
    
