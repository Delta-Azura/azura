




base() {
    cd ~/
    git clone https://github.com/Delta-Azura/onyx.git
    cd onyx
    cd core 
    

}


install() {
    git clone https://github.com/Delta-Azura/onyx.git
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
                pushd $depends1
                fakeroot pkgmk -d
                popd  
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
                pushd $makedepends1
                fakeroot pkgmk -d
                popd 
            fi 
        fi
    done

    fakeroot pkgmk -d 
    if [[ $? == "0" ]]; then 
        echo "Build succeded, use pkgadd or pkgadd -u to install or update $package" 
    fi
}