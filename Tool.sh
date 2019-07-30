Log() {
    log=$1
    echo "******"
    echo $log
    echo "******"
}

Main() {
    funcName=$1
    parm=$2
    if [ "$funcName" = "Log" ]
    then
    Log $parm
    return
    fi

    echo '没有找到此' $funcName '方法'

}

Main $1 $2