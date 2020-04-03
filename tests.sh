#!/bin/bash

x=0

for i in tests/*.jsonnet
do
    json=$(dirname $i)/$( basename $i .jsonnet )_test_output.json
    json_e=$(dirname $i)/$( basename $i .jsonnet )_compiled.json
    t="Compiling $i..."
    if jsonnet  -J . $i > $json
    then
        echo $t OK
    else
        echo $t NOK
        x=1
        continue
    fi

    if [[ "$1" == "update" ]]; then cp $json $json_e; fi

    t="Checking $i..."
    if diff -urt $json $json_e
    then
        echo $t OK
    else
        echo $t NOK
        x=1
    fi
done
exit $x
