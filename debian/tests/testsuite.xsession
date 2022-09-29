#!/bin/sh
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export XDG_CURRENT_DESKTOP=KDE
[ -e debian/tests.home ] || mkdir debian/tests.home
export HOME="$(pwd)/debian/tests.home"
cleanup() {
    kdeinit5_shutdown
    rm -rf ./debian/tests.home
}
trap cleanup EXIT
openbox &
kdeinit5
sleep 5
dh_auto_test --no-parallel
