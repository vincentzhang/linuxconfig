#!/bin/bash
createTunnel() {
    /usr/bin/ssh -f -N -R 10022:localhost:22 -L19922:innisfree.cs.ualberta.ca:22 zichen2@innisfree.cs.ualberta.ca
    if [[ $? -eq 0 ]]; then
        echo Tunnel to innisfree created successfully
    else
        echo An error occurred creating a tunnel to innisfree. Return code: $?
    fi
}
/usr/bin/ssh -p 19922 zichen2@localhost ls > /dev/null
if [[ $? -ne 0 ]]; then
    echo Creating new tunnel connection to innisfree
    createTunnel
else
    echo A tunnel was already created
fi
