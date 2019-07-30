Log() {
    sh Tool.sh "Log" $1
}

checkBrew() {
    Log "检查brew"
    brew -v
    return $?
}

installBrew() {
    Log "安装Brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

searchAndCheckResult=0
searchAndCheck() {
    searchAndCheckResult=0
    str=$1
    searchStr=$2
    search=$(echo $str | grep "$searchStr")
    echo 检测 $searchStr
    if [[ "$search" != "" ]]
    then
        echo 已经安装 $searchStr
    else
        echo 没有安装 $searchStr
        searchAndCheckResult=$searchStr
    fi

}

uninstallStr=''
checkList() {
    uninstallStr=''
    str=$1
    arrStr=$2
    arrStr=${arrStr//" "/ };
    listArr=($arrStr)
    for str in "${listArr[@]}"; do
        searchAndCheck "$result" $str
        if [ $searchAndCheckResult != 0 ]
        then
        uninstallStr="$uninstallStr $searchAndCheckResult"
        fi
    done

}

checkBrewList() {
    Log "检查已安装的列表"

    Log "说明：Node"
    checkArr=('node')
    result=`brew list`
    checkList "$result" "${checkArr[*]}"
    echo $uninstallStr
    if [[ "$uninstallStr" != "" ]]
    then
        echo 安装 $uninstallStr
        brew install $uninstallStr
    fi

    Log "说明：一些快捷工具，快速查看"
    checkArr=(qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package provisionql qlcolorcode)
    result=`brew cask list`
    checkList "$result" "${checkArr[*]}"
    echo $uninstallStr
   
    if [[ "$uninstallStr" != "" ]]
    then
        echo 安装 $uninstallStr
        brew cask install $uninstallStr
    fi

    Log "说明：常用的软件"
    checkArr=(go2shell itsycal google-chrome iterm2 sourcetree)
    result=`brew cask list`
    checkList "$result" "${checkArr[*]}"
    echo $uninstallStr
   
    if [[ "$uninstallStr" != "" ]]
    then
        echo 安装 $uninstallStr
        brew cask install $uninstallStr
    fi


    
}

Main() {
    checkBrew
    if [ $? -eq 1 ] 
    then
    Log "brew没有安装，开始安装brew"
    installBrew
    else
    Log "brew已经安装"
    fi

    checkBrewList

}

Main
# checkBrewList