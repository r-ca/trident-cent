#!/bin/bash

# ユーザー名取得
uname=$(whoami)
_default_home_path=''
local _alternative_home_path='/home/centos'

local function _logger {
    # TODO: Implement
    # 暫定実装
    printf "$1: $2\n"
}

function enable_tri {

    _logger "INFO" "tri-mode init process started"

    _default_home_path=$HOME
    export HOME=$_alternative_home_path
    _logger "INFO" "Homepath was changed: $_default_home_path -> $_alternative_home_path"
    
    export TRI_MODE=true
    _logger "INFO" "tri-mode flag was set: $TRI_MODE"
}

function disable_tri {

    _logger "INFO" "tri-mode exit process started"

    # Restore homepath
    export HOME=$_default_home_path
    _logger "INFO" "Homepath was restored: $_alternative_home_path -> $_default_home_path"

    export TRI_MODE=false
    _logger "INFO" "tri-mode flag was set: $TRI_MODE"
}
