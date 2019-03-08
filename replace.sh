#!/bin/bash
# author: hite


# 修改 bundleid，urltype 里的 bundleId，scheme。

#workflow
plistBuddy=/usr/libexec/PlistBuddy
info_plist='./SameSchemeTest/Info.plist'
bundleId=abc.def
schemeurl=weixin

echo $info_plist

sed  "s/\$scheme/$schemeurl/g" $info_plist
# sed -i '' "s/$schemeIdentifier/${bundleId}/g" $info_plist

# $plistBuddy -c "Set :CFBundleIdentifier $bundleId" $info_plist