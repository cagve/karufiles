from subprocess import check_output

def get_pass(): 
    return check_output("gpg -dq ~/.offlineimap.gpg", shell=True).rstrip(b"\n")
