#!/bin/bash

# ユーザー名取得
uname=$(whoami)
_default_home_path=''
_tri_mode=false
_alternative_home_path='/home/centos'

function _logger {
    # TODO: Implement
    # 暫定実装
    printf "$1: $2\n"
}

# プロンプトの変更
if [ "$_tri_mode" = true ]; then
    export PS1='[🐙 \u@\h \W]\$ '
else
    export PS1='[\u@\h \W]\$ '
fi

function enable_tri {

    if [ "$_tri_mode" = true ]; then
        _logger "INFO" "tri-mode is already enabled"
        return 0
    fi

    _logger "INFO" "tri-mode init process started"

    _default_home_path=$HOME
    export HOME=$_alternative_home_path
    _logger "INFO" "Homepath was changed: $_default_home_path -> $_alternative_home_path"
    
    export _tri_mode=true
    _logger "INFO" "tri-mode flag was set: $TRI_MODE"
}

function disable_tri {

    if [ "$_tri_mode" = false ]; then
        _logger "INFO" "tri-mode is already disabled"
        return 0
    fi

    _logger "INFO" "tri-mode exit process started"

    # Restore homepath
    export HOME=$_default_home_path
    _logger "INFO" "Homepath was restored: $_alternative_home_path -> $_default_home_path"

    export _tri_mode=false
    _logger "INFO" "tri-mode flag was set: $TRI_MODE"
}
