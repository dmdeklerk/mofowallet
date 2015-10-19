VERSION=`cat VERSION`
MODE_JS_FILE='app/mode.js'
MODE_JS=$(cat <<'END_HEREDOC'
/* This file is autogenerated by the build system */
var VERSION='#VERSION#';
var ENABLE_DUAL_ENGINES=false;
var IS_TEST_NET=true;
var FORCE_LOCAL_HOST=false;
var WALLET_NAME='FIMK';
var TRADE_UI_ONLY=true;
var DEBUG=false;
var BUILD_TIMESTAMP=#TIMESTAMP#;
END_HEREDOC
)
cat > $MODE_JS_FILE <<EOF
$MODE_JS
EOF
orig=#VERSION#
sed -i "s/${orig}/${VERSION}/g" $MODE_JS_FILE
orig=#TIMESTAMP#
timestamp=$(date +%s)
sed -i "s/${orig}/${timestamp}/g" $MODE_JS_FILE

rm -r -f dist
grunt build