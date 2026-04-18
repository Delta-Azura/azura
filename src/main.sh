#! /bin/bash




base() {
    cd ~/
    git clone https://github.com/Delta-Azura/onyx.git
    cd onyx
    cd core 
    

}

init() {
    cd /var/cache/
    ls onyx
    if [[ $? != 0 ]]; then 
        git clone https://github.com/Delta-Azura/onyx.git
    else 
        cd onyx 
        git fetch origin 
        BEHIND=$(git rev-list HEAD..origin/main --count)
        if [[ $BEHIND -gt 0 ]]; then
            echo "$BEHIND commit(s) en retard"
            git pull
        fi
    fi

}

install() {
    init() 
    local package="$1"
    cd onyx/$package
    source Pkgfile
    for i in $makedepends; do 
        pkginfo -d $i 
        if [[ $? != 0 ]]; then
            echo "Makedepends aren't installed"
            depends1=$(find -name ../../* "$i" -type d)
            if [[ $? != 0 ]]; then 
                echo "The dependencies aren't in the repo"
                exit
            else
                install "$i"
            fi
        fi
    done 

    for i in $depends; do 
        pkginfo -d $i  
        if [[ $? != 0 ]]; then 
            echo "Dependencies aren't satisfied"
            makedepends1=$(find -name ../../* "$i" -type d) 
            if [[ $? != 0 ]]; then 
                echo "The dependencies aren't in the repo"
                exit
            else 
                install "$i"
            fi 
        fi
    done

    fakeroot pkgmk -d 
    if [[ $? == "0" ]]; then 
        echo "Build succeded, use pkgadd or pkgadd -u to install or update $package" 
    fi
}