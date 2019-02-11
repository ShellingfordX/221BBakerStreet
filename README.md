# 221BBakerStreet
物置です。

## シェルスクリプトを書くときのヒント

### 変数に初期値を設ける
```bash
x=${addr:-value}
```
と書くと、$addr が空の時 value の値が $x に入る

### root 権限で実行しているか調べる
```bash
chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo "sudo 付きで実行してください。"
    exit
  fi
}
```

### ユーザーに選択させる
```bash
while :
do
	echo "選択肢 :"
	echo "   1) 実行"
	echo "   2) ヘルプ"
	echo "   3) 終了"
	read -p "上記の中から一つ数字(半角)を入力して下さい: " option
	case $option in
		1) 
		echo "1"
		exit
		;;
		2)
		echo "2"
		exit
		;;
		*)
		echo "終了します。"
		break
		;;
	esac
done
```
