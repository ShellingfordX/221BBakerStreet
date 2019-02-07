# 221BBakerStreet
物置です。

## シェルスクリプトを書くときのヒント

### 変数に初期値を設ける
```bash
x=${addr:-value}
```
と書くと、addr が空の時 value の値が $x に入る

### root 権限で実行しているか調べる
```bash
chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo "sudo 付きで実行してください。"
    exit
  fi
}
```

