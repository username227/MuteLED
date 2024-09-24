#!/bin/sh
    case "$2" in
        MUTE) /usr/bin/muteled ;;
        *)    logger "ACPI action undefined: $2" ;;
    esac
    ;;

