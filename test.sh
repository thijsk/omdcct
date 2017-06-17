#!/bin/bash

echo "##################"
echo "     TEST #1"
echo "   1 run, sync"
echo "##################"
OPTIONS="-n 8192 -m 8192"

rm plots/* plots-orig/*
time ./plot -k 12345 -x 1 -s 0 -d plots/ ${OPTIONS}
time ./plot-orig -k 12345 -x 1 -s 0 -d plots-orig/ ${OPTIONS}
md5sum plots/* plots-orig/*
time ./optimize plots-orig/*
md5sum plots/* plots-orig/*

echo
echo
echo "##################"
echo "     TEST #2"
echo "   Multiple runs, sync"
echo "##################"
OPTIONS="-n 8192 -m 512"

rm plots/* plots-orig/*
time ./plot -k 12345 -x 1 -s 0 -d plots/ ${OPTIONS}
time ./plot-orig -k 12345 -x 1 -s 0 -d plots-orig/ ${OPTIONS}
md5sum plots/* plots-orig/*
time ./optimize plots-orig/*
md5sum plots/* plots-orig/*

echo
echo
echo "##################"
echo "     TEST #3"
echo "   1 run, async"
echo "##################"
OPTIONS="-n 8192 -m 8192 -a"

rm plots/* plots-orig/*
time ./plot -k 12345 -x 1 -s 0 -d plots/ ${OPTIONS}
time ./plot-orig -k 12345 -x 1 -s 0 -d plots-orig/ ${OPTIONS}
md5sum plots/* plots-orig/*
time ./optimize plots-orig/*
md5sum plots/* plots-orig/*

echo
echo
echo "##################"
echo "     TEST #4"
echo "   Multiple runs, async"
echo "##################"
OPTIONS="-n 8192 -m 512 -a"

rm plots/* plots-orig/*
time ./plot -k 12345 -x 1 -s 0 -d plots/ ${OPTIONS}
time ./plot-orig -k 12345 -x 1 -s 0 -d plots-orig/ ${OPTIONS}
md5sum plots/* plots-orig/*
time ./optimize plots-orig/*
md5sum plots/* plots-orig/*

