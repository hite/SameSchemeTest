#!/bin/bash
# author: hite


# 修改 bundleid，urltype 里的 bundleId，scheme。

#workflow

plistBuddy=/usr/libexec/PlistBuddy
projectName=SameSchemeTest
info_plist="./${projectName}/Info.plist"
schemeurl=yanxuan
dist_dir=`pwd`/build


function changeBundleId
{
    # 开始循环

    bundleIds=('A' 'f' 'com.xx')

    for bundleId in ${bundleIds[@]}; do

        # 还原文件 否则下面 sed 替换不正确
        git checkout $info_plist
        
        sed -i '' 's#<string>$scheme</string>#<string>'${schemeurl}'</string>#g' $info_plist
        # sed -i '' 's#<string>$schemeIdentifier</string>#<string>'$bundleId'</string>#g' $info_plist
        $plistBuddy -c "Set :CFBundleIdentifier $bundleId" $info_plist
        $plistBuddy -c "Set :CFBundleName $bundleId" $info_plist

        # 安装到模拟器
        xcodebuild -project "$projectName".xcodeproj -scheme "$projectName"  -destination generic/platform=iOS -configuration Debug clean build CONFIGURATION_BUILD_DIR=$dist_dir/

        xcrun simctl install booted "$dist_dir/${projectName}.app"

        echo 'Install '${bundleId}' done. continue ?(Y or N)'
        read cnt
        if [[ $cnt == 'Y' || $cnt == 'y' ]] ; then
            echo '....'
        else
            break
        fi
    done
}


changeBundleId
