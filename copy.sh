#!/bin/sh

# 第一引数 コンテストレベル
# 第二引数 コンテスト番号
# sh coppy.sh 1

# 引数が正しく入力されていない場合
if [ ! $# -eq 1 ];then
  echo """
  -------ERROR-------
  コンテストの回数を記載してください
  sh copy.sh 1
  """
  exit
fi

# 現在のパスを取得
path=$(cd $(dirname $0); pwd)
# コンテスト番号
contestNumber="$1"

# コピー 上書き時警告表示
if [ -e ${path}"/"${contestNumber} ];then
  echo "同じ名前のファイルが以下のパスで見つかりました"
  echo ${path}"/""第"${contestNumber}"回"
  read -p "上書きしますか？ (y/N): " yn
  case "$yn" in
    [yY]*) rm -rf ${path}"/"${contestNumber}
              cp -r copy "第"${contestNumber}"回"
              echo "完了しました";;
    *) echo "キャンセルしました";;
  esac
else
  cp -r -i copy "第"${contestNumber}"回"
  echo "完了しました"
fi
