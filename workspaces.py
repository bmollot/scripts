#!/bin/python

import json, sys, subprocess, socket
s = socket.socket(socket.AF_INET, socket.SOCK_STEAM)
s.bind()
workspaces_dump = json.loads(subprocess.check_output(["/usr/bin/i3-msg", "-t", "get_workspaces"]).decode("utf-8"))
workspaces = []
for element in workspaces_dump:
    text = '<span fgcolor="#eceff1" bgcolor="'
    if element['urgent']:
        text += '#03A9F4'
    elif element['focused']:
        text += '#009688'
    elif element['visible']:
        text += '#37474F'
    else:
        text += '#263238'
    text += '"> ' + element['name'].split(':')[1] + ' </span>'
    workspaces.append(text)
print("".join(workspaces))
