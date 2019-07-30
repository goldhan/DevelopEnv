Log() {
    sh Tool.sh "Log" $1
}

Welcome() {
    Log "欢迎使用"
    Log "说明：以下软件请自行进行APPStore安装"
    echo "
    1	WPS
	2	Spark
	3	Simple Antsnotes
	4	SinppetsLab
	5	Simplenote
	6	QQ WeChat
    7   XCode
    "

}

Main() {
    Welcome
    sh ./Brew.sh
}

Main